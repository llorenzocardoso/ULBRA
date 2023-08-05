<!DOCTYPE html>
<html lang="pt-br">

<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Projeto AS</title>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<?=base_url("assets/js/script.css")?>" ></script>
	<link rel="stylesheet" href="<?=base_url("assets/css/style-adm.css")?>" />
</head>

<body>
	<header class="container-fluid p-3 text-center">
		<h1>Área Administrativa</h1>
		<a class="text-dark" href="<?=base_url("admin/logout")?>">Logout</a>
	</header>
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-black p-3">

			<div class="container-fluid">

			<a class="navbar-brand" href="<?=base_url("admin")?>">PHP AS</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			
				<ul class="navbar-nav ms-auto ">
					<li class="nav-item">
						<a class="nav-link mx-2 text-light" href="<?=base_url("admin/listClients")?>">Lista de Clientes</a>
					</li>
					<li class="nav-item">
						<a class="nav-link mx-2 text-light" href="<?=base_url("admin/insertClient")?>">Cadastrar Clientes</a>
					</li>
					<li class="nav-item">
						<a class="nav-link mx-2 text-light" href="<?=base_url("admin/listContacts")?>">Lista de Contatos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link mx-2 text-light" href="<?=base_url('/api/client')?>">API</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
			<section class="p-3 col-md-12">