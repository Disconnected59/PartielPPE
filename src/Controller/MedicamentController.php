<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class MedicamentController extends AbstractController
{
    /**
     * @Route("/medicament", name="medicament")
     */
    public function index()
    {
        return $this->render('medicament/index.html.twig', [
            'controller_name' => 'MedicamentController',
        ]);
    }
}
