<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\IndicationRepository")
 */
class Indication
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $posologie;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Traitement")
     */
    private $traitement;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Medicament")
     */
    private $medicament;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPosologie(): ?string
    {
        return $this->posologie;
    }

    public function setPosologie(string $posologie): self
    {
        $this->posologie = $posologie;

        return $this;
    }

    public function getTraitement(): ?Traitement
    {
        return $this->traitement;
    }

    public function setTraitement(?Traitement $traitement): self
    {
        $this->traitement = $traitement;

        return $this;
    }

    public function getMedicament(): ?Medicament
    {
        return $this->medicament;
    }

    public function setMedicament(?Medicament $medicament): self
    {
        $this->medicament = $medicament;

        return $this;
    }
}
