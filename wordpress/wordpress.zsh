wp() {
    if [ "$1" = "new" ]; then
        if [ -z "$2" ]; then
            echo "Usage: wp new <site-name>"
            return 1
        fi

        local site_name="$2"

        echo "Creating WordPress site: $site_name"

        # Ask about database creation
        echo -n "Create MySQL database '$site_name'? (y/n): "
        read create_db

        if [[ "$create_db" =~ ^[Yy]$ ]]; then
            echo "Creating database: $site_name"
            if command -v mysql >/dev/null 2>&1; then
                mysql -h 127.0.0.1 -u root -e "CREATE DATABASE IF NOT EXISTS \`$site_name\`;"
                if [ $? -eq 0 ]; then
                    echo "Database '$site_name' created successfully"
                else
                    echo "Error: Could not create database"
                fi
            else
                echo "MySQL client not found. Please create database '$site_name' manually in DBngin"
            fi
        else
            echo "Skipping database creation. Remember to create '$site_name' manually"
        fi

        # Create directory structure
        mkdir -p "$site_name/public"
        cd "$site_name/public"

        # Download WordPress
        command wp core download

        # Create wp-config with database settings
        command wp config create \
            --dbname="$site_name" \
            --dbuser="root" \
            --dbpass="" \
            --dbhost="127.0.0.1" \
            --skip-check

        echo "WordPress downloaded to: $site_name/public/"
        echo "wp-config.php configured for database '$site_name'"
        echo "You are now in: $(pwd)"

    else
        command wp "$@"
    fi
}
