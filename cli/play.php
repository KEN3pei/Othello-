<?php
require_once("set.php");
require_once("change.php");
require_once("canput.php");
require_once("changeplayer.php");

class Play 
{
    function playOthello(){
        // 初期値のセット
        $set = new SetInitial();
        echo "player1か2を選択 ";
        $player = $set->setPlayer();
        $array = $set->initial_value();
        $buck_array = $array;

        // オセロが置けなければ標準入力をさせ直す。置ければ次の処理
        $inoutput = new InOutPut;
        while ($array == $buck_array){
            $inoutput->array = $array;
            $inoutput->player = $player;
            $inoutput->outPut();
            $array = $inoutput->inPut();
            if ($array == $buck_array){
                echo "もう一度入力してください\n";
            }else{
                $inoutput->array = $array;
                $inoutput->outPut();
            }
        }

        $chechboard = new CheckBoard();
        $chechboard->player = $player;
        $chechboard->array = $array;
        $canput_count = $chechboard->canPut();

        $changeplayer = new ChangePlayer;
        //置ける場所が0個でなければplayer交代、
        while ($canput_count !== 0){
            $player = 3 - $player;
            $chechboard->player = $player;
            $chechboard->array = $array;
            $canput_count = $chechboard->canPut();
                if ($canput_count == 0){
                    $chechboard->player = 3 - $player;  // 置けるところがなくなったらplayerを一度変えてみる
                    $canput_count = $chechboard->canPut();
                    if ($canput_count == 0){
                        break;                          // playerを交代しても置けるところがなければ終了
                    }
                    echo "置けるところがないのでスキップします";
                    $player = 3 - $player;
                }
            echo "置けるパターン数 : " . $canput_count . "パターン \n";
            $changeplayer->player = $player;
            $changeplayer->array = $array;
            $array = $changeplayer->changePlayerInput();
        }

        $player1 = 0;
        $player2 = 0;
        foreach ($array as $value){
            foreach ($value as $num){
                if ($num == 1){
                    $player1 += 1;
                }elseif ($num == 2){
                    $player2 += 1;
                }   
            }   
        }
    
        echo "置けるところがなくなりました\n";
        echo "Player1は" . $player1 . "\n";
        echo "Player2が" . $player2;
    }
}