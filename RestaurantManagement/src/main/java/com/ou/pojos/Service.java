package com.ou.pojos;

import javax.persistence.*;
import java.math.BigDecimal;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "service")
public class Service {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ser_id", nullable = false)
    private Integer id;

    @Size(min = 5, max = 255, message = "{err.serviceName.lengh}")
    @Column(name = "ser_name", length = 255)
    private String serName;

    @NumberFormat
    @NotNull(message = "{err.notNull}")
    @Min(value = 100000, message = "{service.min.errMsg}")
    @Max(value = 200000000, message = "{service.max.errMsg}")
    @Column(name = "ser_price", precision = 10)
    private BigDecimal serPrice;

    @Column(name = "ser_is_active")
    private Boolean serIsActive;

    @Size(min = 0, max = 500, message = "{err.serviceDescription.lengh}")
    @Column(name = "ser_description")
    private String serDescription;

    @Column(name = "ser_image")
    private String serImage;

    @Transient
    private MultipartFile file;

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSerName() {
        return serName;
    }

    public void setSerName(String serName) {
        this.serName = serName;
    }

    public BigDecimal getSerPrice() {
        return serPrice;
    }

    public void setSerPrice(BigDecimal serPrice) {
        this.serPrice = serPrice;
    }

    public Boolean getSerIsActive() {
        return serIsActive;
    }

    public void setSerIsActive(Boolean serIsActive) {
        this.serIsActive = serIsActive;
    }

    public String getSerDescription() {
        return serDescription;
    }

    public void setSerDescription(String serDescription) {
        this.serDescription = serDescription;
    }

    public String getSerImage() {
        return serImage;
    }

    public void setSerImage(String serImage) {
        this.serImage = serImage;
    }

}
