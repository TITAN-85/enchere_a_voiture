<?php

/**
 * Classe Contrôleur des requêtes de l'application admin
 */

class Admin extends Routeur {

  protected $utilisateur_id;
  protected $timbre_id;

  protected static $entite;
  protected static $action;
  protected static $oUtilConn; // objet Utilisateur connecté
  
  protected $classRetour = "fait";
  protected $messageRetourAction = "";

  private $methodes;

  /**
   * Constructeur qui initialise des propriétés à partir du query string
   * 
   */
  public function __construct() {
    self::$entite = $_GET['entite'] ?? 'Utilisateur';
    self::$action = $_GET['action'] ?? 'l';
  }

  /**
   * Gérer l'interface d'administration 
   */  
  public function gererEntite() {
    if (isset($_SESSION['oUtilConn'])) {
      self::$oUtilConn = $_SESSION['oUtilConn'];
      $entite = ucwords(self::$entite);
      $classe = "Admin$entite";
      // var_dump($classe); exit; // AdminUtilisateur
      if (class_exists($classe)) {
        (new $classe())->gererAction();
      } else {
        throw new Exception("L'entité ".self::$entite." n'existe pas.");
      }
    } else {
      (new AdminUtilisateur)->connecter();
    }    
  }

  /**
   * Gérer l'interface d'administration d'une entité
   */  
  public function gererAction() {
    if (isset($this->methodes[self::$action])) {
      $methode = $this->methodes[self::$action]['nom'];
      $this->$methode();
    }
  }


}