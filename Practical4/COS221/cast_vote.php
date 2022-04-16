<?php

require_once("config.php");
$db = Database_Connection::getInstance();
session_start();

function getPartyCurrentVotess($party_voter,$c){
    $sql1="SELECT Votes FROM Running_For WHERE MDB_Code='".$_SESSION["mdb_code"]."' AND Party='".$party_voter."'";
    $party_votes=$c->query($sql1);

    while ($anotherRow=$party_votes->fetch_assoc())
    {
        $v=$anotherRow['Votes'];
        return $v;
    }
}

function getIndContCurrentVotess($Vid,$c){
    $sql1="SELECT Votes FROM Individual_Contestant WHERE National_Id='".$Vid."'";
    $party_votes=$c->query($sql1);

    while ($anotherRow=$party_votes->fetch_assoc())
    {
        $v=$anotherRow['Votes'];
        return $v;
    }
}

function updatePartyCurrentVotess($party_voter,$c){
    $currentVotes=getPartyCurrentVotess($party_voter,$c);
    $currentVotes++;
    $sql1="UPDATE Running_For SET Votes =".$currentVotes." WHERE MDB_Code='".$_SESSION["mdb_code"]."' AND Party='".$party_voter."'";
    $c->query($sql1);
}

function updateIndContCurrentVotess($Vid,$c){
    $currentVotes=getIndContCurrentVotess($Vid,$c);
    $currentVotes++;
    $sql1="UPDATE Individual_Contestant SET Votes=".$currentVotes." WHERE National_Id='".$Vid."'";
    $c->query($sql1);
}

if ($_SERVER["REQUEST_METHOD"]=="POST"){
    $indivi_vote=$_POST["indCan"];
    $party_voter=$_POST["party"];
    $id=$_SESSION["id"];

    $conn=$db->getConnection();

    $sql1="UPDATE Person SET has_Voted = 1 WHERE National_Id = '$id'";
    $conn->query($sql1);


    updateIndContCurrentVotess($indivi_vote,$conn);
    updatePartyCurrentVotess($party_voter, $conn);
    header('location: index.php');
    echo "Hello";
}
else{
    /* relocate then output message */
    echo "No user found";

}

?>