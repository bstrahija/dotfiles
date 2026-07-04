local M = {}

local state_file = vim.fn.stdpath("state") .. "/projects.json"
local root_markers = {
    ".git",
    "artisan",
    "composer.json",
    "package.json",
    "pnpm-workspace.yaml",
    "turbo.json",
    "nx.json",
}

local function normalize(path)
    return vim.fs.normalize(vim.fn.fnamemodify(path, ":p"))
end

local function state_dir()
    return vim.fn.fnamemodify(state_file, ":h")
end

local function read_state()
    local ok, lines = pcall(vim.fn.readfile, state_file)
    if not ok or #lines == 0 then
        return {}
    end

    local ok_decode, decoded = pcall(vim.json.decode, table.concat(lines, "\n"))
    if ok_decode and type(decoded) == "table" then
        return decoded
    end

    return {}
end

local function write_state(projects)
    vim.fn.mkdir(state_dir(), "p")
    vim.fn.writefile({ vim.json.encode(projects) }, state_file)
end

local function add_project(projects, path)
    path = normalize(path)
    if path == "" then
        return projects
    end

    local out = { path }
    for _, existing in ipairs(projects) do
        if normalize(existing) ~= path then
            table.insert(out, existing)
        end
    end

    while #out > 50 do
        table.remove(out)
    end

    return out
end

local function project_root(path)
    if not path or path == "" then
        path = vim.api.nvim_buf_get_name(0)
    end

    if path == "" or vim.bo.buftype ~= "" then
        path = vim.fn.getcwd()
    end

    local found = vim.fs.find(root_markers, {
        upward = true,
        path = path,
        limit = 1,
    })

    if #found > 0 then
        return vim.fs.dirname(found[1])
    end

    return vim.fn.fnamemodify(path, ":p:h")
end

local function recent_projects()
    local projects = read_state()

    if vim.fn.executable("zoxide") == 1 then
        local ok, zoxide = pcall(vim.fn.systemlist, { "zoxide", "query", "-l" })
        if ok and type(zoxide) == "table" then
            for _, path in ipairs(zoxide) do
                if path ~= "" then
                    projects = add_project(projects, path)
                end
            end
        end
    end

    return projects
end

local function switch_to(path)
    if not path or path == "" then
        return
    end

    path = normalize(path)
    if vim.uv.fs_stat(path) == nil then
        vim.notify("Project not found: " .. path, vim.log.levels.WARN)
        return
    end

    vim.api.nvim_set_current_dir(path)
    write_state(add_project(read_state(), path))
    pcall(function()
        vim.cmd("Oil " .. vim.fn.fnameescape(path))
    end)
end

function M.record_cwd()
    write_state(add_project(read_state(), vim.fn.getcwd()))
end

function M.pick()
    local projects = recent_projects()
    if #projects == 0 then
        vim.notify("No projects found yet", vim.log.levels.INFO)
        return
    end

    vim.ui.select(projects, {
        prompt = "Switch Project",
        format_item = function(item)
            return vim.fn.fnamemodify(item, ":~")
        end,
    }, function(choice)
        if choice then
            switch_to(choice)
        end
    end)
end

function M.pick_current_root()
    switch_to(project_root())
end

function M.find_files()
    local ok, telescope = pcall(require, "telescope.builtin")
    if not ok then
        vim.notify("Telescope is not available", vim.log.levels.WARN)
        return
    end

    telescope.find_files({
        cwd = project_root(),
        hidden = true,
    })
end

function M.recent()
    local projects = recent_projects()
    if #projects == 0 then
        vim.notify("No recent projects found", vim.log.levels.INFO)
        return
    end

    vim.ui.select(projects, {
        prompt = "Recent Projects",
        format_item = function(item)
            return vim.fn.fnamemodify(item, ":~")
        end,
    }, function(choice)
        if choice then
            switch_to(choice)
        end
    end)
end

local api = vim.api
api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
    group = api.nvim_create_augroup("DotfilesProjects", { clear = true }),
    callback = function()
        M.record_cwd()
    end,
})

M.project_root = project_root
M.switch_to = switch_to

return M
