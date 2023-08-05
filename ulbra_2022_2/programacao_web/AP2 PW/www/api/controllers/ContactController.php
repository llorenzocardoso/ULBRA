<?php

class ContactController{

    var $ContactModel;


    public function __construct(){
        require_once('models/ContactModel.php');
        $this -> ContactModel = new ContactModel();
    }

    public function insertContact(){
            $client = json_decode(file_get_contents("php://input"));
            $arrayClient = (array) $client;
            $this -> ContactModel -> insertContact($arrayClient);
            header('content-type: application/json');
            echo('
                {
                    "success" : "1",
                    "message":"Contato inserido!"
                }
            ');
    }

    public function listContacts(){
        $result = $this -> ContactModel->listContacts();
        $arrayClients =  array();
        while ($line = $result->fetch_assoc()) {
            array_push($arrayClients, $line);
        }
        header('content-type: application/json');
        echo json_encode($arrayClients);
    }


    public function consultContact($idClient){
        $result = $this -> ContactModel->consultContacts($idClient);

        if($arrayClient = $result->fetch_assoc()){
            header('content-type: application/json');
            echo json_encode($arrayClient);
        }else{
            header('content-type: application/json');
            echo json_encode('
                {
                    "error" : "1",
                    "message":"Cliente não encontrado!"
                }
            ');
        }
    }

   


}
