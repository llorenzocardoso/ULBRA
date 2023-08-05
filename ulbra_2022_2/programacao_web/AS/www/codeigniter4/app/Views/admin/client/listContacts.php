<h1>Listagem de contatos</h1>

<table class="table table-striped">

    <tr>
        <th>ID do contato</th>
        <th>Nome</th>
        <th>Email</th>
        <th>Address</th>
    </tr>
<?php
    foreach ($arrayClients as $client){  
?>
    <tr>
        <td>
            <?=$client['idContact']?>
        </td>
        <td>
            <?=$client['name']?>
        </td>
        <td>
            <?=$client['email']?>
        </td>
        <td>
            <?=$client['message']?>
        </td>
    </tr>
<?php
    }
?>

</table>