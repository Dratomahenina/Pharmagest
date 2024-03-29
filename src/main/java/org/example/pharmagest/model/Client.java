package org.example.pharmagest.model;

import javafx.beans.property.*;

import java.time.LocalDate;

public class Client {
    private IntegerProperty idClient;
    private StringProperty nomClient;
    private StringProperty prenomClient;
    private ObjectProperty<LocalDate> dateNaissanceClient;
    private StringProperty adresseClient;
    private StringProperty telephoneClient;
    private StringProperty nomMedecin;
    private ObjectProperty<LocalDate> dateCreation;

    public Client(int idClient, String nomClient, String prenomClient, LocalDate dateNaissanceClient, String adresseClient, String telephoneClient, String nomMedecin, LocalDate dateCreation) {
        this.idClient = new SimpleIntegerProperty(idClient);
        this.nomClient = new SimpleStringProperty(nomClient);
        this.prenomClient = new SimpleStringProperty(prenomClient);
        this.dateNaissanceClient = new SimpleObjectProperty<>(dateNaissanceClient);
        this.adresseClient = new SimpleStringProperty(adresseClient);
        this.telephoneClient = new SimpleStringProperty(telephoneClient);
        this.nomMedecin = new SimpleStringProperty(nomMedecin);
        this.dateCreation = new SimpleObjectProperty<>(dateCreation);
    }

    public int getIdClient() {
        return idClient.get();
    }

    public IntegerProperty idClientProperty() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient.set(idClient);
    }

    public String getNomClient() {
        return nomClient.get();
    }

    public StringProperty nomClientProperty() {
        return nomClient;
    }

    public void setNomClient(String nomClient) {
        this.nomClient.set(nomClient);
    }

    public String getPrenomClient() {
        return prenomClient.get();
    }

    public StringProperty prenomClientProperty() {
        return prenomClient;
    }

    public void setPrenomClient(String prenomClient) {
        this.prenomClient.set(prenomClient);
    }

    public LocalDate getDateNaissanceClient() {
        return dateNaissanceClient.get();
    }

    public ObjectProperty<LocalDate> dateNaissanceClientProperty() {
        return dateNaissanceClient;
    }

    public void setDateNaissanceClient(LocalDate dateNaissanceClient) {
        this.dateNaissanceClient.set(dateNaissanceClient);
    }

    public String getAdresseClient() {
        return adresseClient.get();
    }

    public StringProperty adresseClientProperty() {
        return adresseClient;
    }

    public void setAdresseClient(String adresseClient) {
        this.adresseClient.set(adresseClient);
    }

    public String getTelephoneClient() {
        return telephoneClient.get();
    }

    public StringProperty telephoneClientProperty() {
        return telephoneClient;
    }

    public void setTelephoneClient(String telephoneClient) {
        this.telephoneClient.set(telephoneClient);
    }

    public String getNomMedecin() {
        return nomMedecin.get();
    }

    public StringProperty nomMedecinProperty() {
        return nomMedecin;
    }

    public void setNomMedecin(String nomMedecin) {
        this.nomMedecin.set(nomMedecin);
    }

    public LocalDate getDateCreation() {
        return dateCreation.get();
    }

    public ObjectProperty<LocalDate> dateCreationProperty() {
        return dateCreation;
    }

    public void setDateCreation(LocalDate dateCreation) {
        this.dateCreation.set(dateCreation);
    }
}