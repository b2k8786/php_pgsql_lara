<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;

class Main extends BaseController
{
    function test()
    {
        echo "Hello from test";
    }
}