<?php

namespace App;

use function Bla\test;

class App
{
    protected string $message = 'Hello, World!';

    public function __construct()
    {
        self::stat(1, 'string');

        $this->message = $this->message.' from App class!';

        echo $this->message;
    }

    /**
     * A test method that returns a string.
     *
     * @param  string  $b
     * @return void
     */
    public function test(int $a, $b = null): int
    {
        $arr = [
            'key1' => 'value1',
            'key24324' => 'value2',
            'key3321' => 'value3',
            'key4' => 'value4',
        ];

        $lelele = 1;
        $a = 3;

        // Hey hey
        $class = new class
        {
            public function getMessage(): string
            {
                return 'This is a message from the anonymous class.';
            }
        };

        return 'This is a test method.';
    }

    public static function stat($hehe)
    {
        return $hehe;
    }
}
