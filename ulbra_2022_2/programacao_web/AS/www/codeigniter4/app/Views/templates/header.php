<!DOCTYPE html>
<html lang="pt-br">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Projeto AS</title>

	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- JS e CSS -->
	<script src="assets/js/script.js"></script>
	<link rel="stylesheet" href="<?=base_url("assets/css/style-public.css")?>">

	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/ecbe0dc84e.js" crossorigin="anonymous"></script>

</head>

<body>
	<header class="container-fluid bg-black text-white text-center">
		<h1>PHP AS</h1>
	</header>
	
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark bg-black p-3 navteste">

			<div class="container-fluid">

			<a class="navbar-brand" href="<?=base_url('home')?>">PHP AS</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
				<div class=" collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item dropdown">
							<a class="nav-link mx-2 dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Menu
							</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
								<li><a class="nav-link mx-2 text-dark" href="<?=base_url('about')?>">Sobre</a></li>
								<li><a class="nav-link mx-2 text-dark" href="<?=base_url('products')?>">Produtos</a></li>
								<li><a class="nav-link mx-2 text-dark" href="<?=base_url('contact')?>">Contato</a></li>
								<li><a class="nav-link mx-2 text-dark" href="<?=base_url('listClients')?>">Clientes</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div class="container-fluid">
		<div class="row">

			<section class="col-md-9 p-4">