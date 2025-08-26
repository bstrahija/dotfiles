<?php
use Illuminate\Support\Collection;

$test = new Collection();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Test Blade Format</title>
</head>

<body>
    @if ($a > 10)
        <p>A is greater than 10</p>
    @endif

    @php
        echo 'This will be rendered as @php';
        $bla = new Collection([1, 2, 3]);
    @endphp

    <div>
        Creolab

        Infusionsoft
        Keap

    </div>
</body>

</html>
