<?php 
session_start();
require_once "api.php";
require_once "form/formhelper.php";

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    list($errors, $input) = validate();
    if($errors){
        show_form($errors);
    }else{
        process_form($input);
    }
}else{
    show_form();
}

function show_form($errors = array()){

    if(!isset($_SESSION["array"])){
        $h = 4;
        $w = 4;
        $_SESSION["array"] = initial_value($h, $w);
    }
    if(!isset($_SESSION["player"])){
        $_SESSION["player"] = "1";
    }
    if(!isset($_SESSION["canput_count"])){
        $_SESSION["canput_count"] = "4";
    }
    $api = new Api;
    $form = new FormHelper;
    include 'form/index-form.php';
}

function validate(){
    $input['x'] = filter_input(INPUT_POST, 'x', FILTER_VALIDATE_INT);
    if(is_null($input['x']) || ($input['x'] === false)){
        $errors[] = "x is validated";
    }
    $input['y'] = filter_input(INPUT_POST, 'y', FILTER_VALIDATE_INT);
    if(is_null($input['y']) || ($input['y'] === false)){
        $errors[] = "y is validated";
    }
    return array($errors, $input);
}

function process_form($input){
    
    $api = new Api;
    $x = $input['x'];
    $y = $input['y'];
    $player = $_POST['player'];
    $array = array_chunk($_POST['array'],6);
    list($_SESSION['array'], $_SESSION["player"], $_SESSION["canput_count"]) = $api->getArrayPlayer($x, $y, $array, $player);
    
    include 'form/index-form.php';
}


function initial_value($h, $w) {

    for ($i = 0; $i < $h+2; $i++){
        for ($v = 0; $v < $w+2; $v++){
            $array[$i][$v] =  "-1";
        }
    }
    for ($y = 1; $y <= $h; $y++){
        for ($x = 1; $x <= $w; $x++){
            $array[$y][$x] = " 0";
        }
    }
    $array[$h/2][$w/2] = $array[($h/2)+1][($w/2)+1] = " 2";
    $array[$h/2][($w/2)+1] = $array[($h/2)+1][$w/2] = " 1";
    return $array;
}
