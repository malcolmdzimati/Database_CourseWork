<?php
require_once("config.php");
$db=Database_Connection::getInstance();

session_start();
function extractMDBCode($id, $c){
    $q1="SELECT MDB_Code FROM Person NATURAL JOIN Ward WHERE National_ID= '$id'";
    $r1=$c->query($q1);

    while ($row=$r1->fetch_assoc())
    {
        $mdb=$row['MDB_Code'];
        return $mdb;
    }
}

function extractMunicipalityType($id,$c){

    $mdb=extractMDBCode($id,$c);
    $q2="SELECT MType FROM Municipality WHERE MDB_Code= '$mdb'";
    $r2=$c->query($q2);

    while ($anotherRow=$r2->fetch_assoc())
    {
        $type=$anotherRow['MType'];
        return $type;
    }
}

function extractParties($mdb, $c){
    $parties=[];
    $q1="SELECT b.Party, b.PName FROM Running_For AS a INNER JOIN Candidate_Party AS b ON a.Party=b.Party WHERE MDB_Code='$mdb'";
    $r1=$c->query($q1);
    $i=0;

    while ($row=$r1->fetch_assoc())
    {
        $parties[$i]["Party"]= $row['Party'];
        $parties[$i]["name"]= $row['PName'].' ('.$row['Party'].')';
        $i++;
    }

    return $parties;
}

function extractIndividual($voterID,$c){
    $individualContestants=[];
    $q1="SELECT National_Id FROM Individual_Contestant
            WHERE Ward_Num=(SELECT Ward_Num FROM Person WHERE National_Id=$voterID)";
    $r1=$c->query($q1);

    while ($row=$r1->fetch_assoc())
    {
        $id=$row['National_Id'];
        $q2="SELECT Last_Name, First_Name, National_Id FROM Person WHERE National_Id= '$id'";
        $r2=$c->query($q2);
        $i=0;

        while ($anotherRow=$r2->fetch_assoc())
        {
            $individualContestants[$i]["National_Id"]= $anotherRow['National_Id'];
            $individualContestants[$i]["Name"]= $anotherRow['First_Name'].' '.$anotherRow['Last_Name'];
            $i++;
        }

    }
    return $individualContestants;
}

function getAdress($voterID,$c){
    $q2="SELECT Address FROM Person WHERE National_Id= '$voterID'";
    $r2=$c->query($q2);
    while ($anotherRow=$r2->fetch_assoc())
    {
        $ad=$anotherRow['Address'];
        return $ad;
    }
}

function getMuncipality($mdbcode,$c){
    $q2="SELECT MName FROM Municipality WHERE MDB_Code= '$mdbcode'";
    $r2=$c->query($q2);
    while ($anotherRow=$r2->fetch_assoc())
    {
        $name=$anotherRow['MName'];
        return $name;
    }
}

if (isset($_SESSION["id"]))
{
    if ($_SESSION["voted"]){
        /* Say something but the ballot paper will not appear because user has voted */
        echo '<!DOCTYPE html>
                <html>
                <head>
                </head>
                <body>
                <H1>Thank You for Already had voting</H1>
                </body>
                </html>';
    }else{
        $conn=$db->getConnection();
        $mdbcode=extractMDBCode($_SESSION["id"],$conn);
        $_SESSION["mdb_code"]=$mdbcode;
        $parties = extractParties($mdbcode, $conn);
        $individualContestants = extractIndividual($_SESSION["id"], $conn);
        $municpalityType = extractMunicipalityType($_SESSION["id"], $conn);
        $address = getAdress($_SESSION['id'],$conn);
        $munci = getMuncipality($mdbcode,$conn);
        echo '<!DOCTYPE html>
                <html>
                <head>
                </head>
                <body>
                <h1>Ballot Paper For: </h1>
                <h3>Name: '.$_SESSION["User"].'</h3>
                <h3>National ID Number: '.$_SESSION["id"].'</h3>
                <h3>Address: '.$address.'</h3>
                <h3>Municipality: '.$munci .' ('.$municpalityType.')</h3><br>
                <div><form action="cast_vote.php" method="POST">';
        echo '<h3>Choose Individual Contestant:</h3>';
        foreach ($individualContestants as $value) {
            echo '<input type="radio" id="'.$value['National_Id'].'" name="indCan" 
                    value="'.$value['National_Id'].'" required><label for="'.$value['National_Id'].'"> '.$value['Name'].'</label><br>';
        }
        echo '<br><br>';

        echo '<h3>Choose Party:</h3>';
        foreach ($parties as $value) {
            echo '<input type="radio" id="'.$value['Party'].'" name="party" 
                    value="'.$value['Party'].'" required><label for="'.$value['Party'].'"> '.$value['name'].'</label><br>';
        }

        if($municpalityType==="District") {
            echo '<br><br>';

            echo '<h3>Choose Party For Seats:</h3>';
            foreach ($parties as $value) {
                echo '<input type="radio" id="'.$value['Party'].'" name="partyseats" 
                    value="'.$value['Party'].'" required><label for="'.$value['Party'].'"> '.$value['name'].'</label><br>';
            }
        }

        echo '<br><input type="submit" value="Submit"></form></div>';

        echo ' </body>
               </html>';
    }
}
?>