package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name = "background")
public class Background {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "tieude_welcome")
    private String tieudeWelcome;
    @Column
    private String sologanHabour;
    @Column
    private String logo;
    @Column
    private String mainPhoto;
    @Column
    private String footerPhoto;
    @Column
    private String tieuDeCauCamOn;
    @Column
    private String noiDungCauCamOn;

    public String getTieudeWelcome() {
        return this.tieudeWelcome;
    }

    public void setTieudeWelcome(final String tieudeWelcome) {
        this.tieudeWelcome = tieudeWelcome;
    }

    public String getSologanHabour() {
        return this.sologanHabour;
    }

    public void setSologanHabour(final String sologanHabour) {
        this.sologanHabour = sologanHabour;
    }

    public String getLogo() {
        return this.logo;
    }

    public void setLogo(final String logo) {
        this.logo = logo;
    }

    public String getTieuDeCauCamOn() {
        return this.tieuDeCauCamOn;
    }

    public void setTieuDeCauCamOn(final String tieuDeCauCamOn) {
        this.tieuDeCauCamOn = tieuDeCauCamOn;
    }

    public String getNoiDungCauCamOn() {
        return this.noiDungCauCamOn;
    }

    public void setNoiDungCauCamOn(final String noiDungCauCamOn) {
        this.noiDungCauCamOn = noiDungCauCamOn;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(final Integer id) {
        this.id = id;
    }

    public String getMainPhoto() {
        return this.mainPhoto;
    }

    public void setMainPhoto(final String mainPhoto) {
        this.mainPhoto = mainPhoto;
    }

    public String getFooterPhoto() {
        return this.footerPhoto;
    }

    public void setFooterPhoto(final String footerPhoto) {
        this.footerPhoto = footerPhoto;
    }
}