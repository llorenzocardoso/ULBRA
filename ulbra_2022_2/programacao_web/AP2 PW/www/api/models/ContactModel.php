<?php

class ContactModel{

    var $connection;

    public function __construct(){
        require_once('db/ConnectClass.php');
        $ConnectClass = new ConnectClass();
        $ConnectClass -> openConnect();
        $this -> Connection = $ConnectClass -> getConn();
    }

    public function listContacts(){
        $sql = "SELECT * FROM contacts";
        return $this ->Connection -> query($sql);
    }

    public function consultContacts($idClient){
        $sql = "
            SELECT * FROM contacts
            WHERE
            idContact = $idClient
        ";
        return $this -> Connection -> query($sql);
    }

    public function insertContact($arrayClient){
        $sql = "
           INSERT INTO 
                contacts (name, email, message)
            VALUES
                (
                 '{$arrayClient['name']}', 
                 '{$arrayClient['email']}',
                 '{$arrayClient['message']}'
                )
        ";
        return $this -> Connection -> query($sql);
    }

}