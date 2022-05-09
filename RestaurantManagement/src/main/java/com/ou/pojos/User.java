package com.ou.pojos;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id", nullable = false)
    private Integer id;

    @Size(min = 9, max = 12, message = "{user.userIdCart.lenErr}")
    @Pattern(regexp = "^[0-9]*$", message = "{user.userIdCart.err}")
    @Column(name = "user_id_card", nullable = false, length = 12)
    private String userIdCard;

    @Pattern(regexp = "^[0-9]{10}$", message = "{user.userNPhone.err}")
    @Column(name = "user_phone_number", nullable = false, length = 10)
    private String userPhoneNumber;

    @Column(name = "user_sex")
    private Boolean userSex;

    @Size(min = 1, max = 50, message = "{user.lastName.lenErr}")
    @Column(name = "user_last_name", nullable = false, length = 50)
    private String userLastName;

    @Size(min = 1, max = 20, message = "{user.firstName.lenErr}")
    @Column(name = "user_first_name", nullable = false, length = 20)
    private String userFirstName;

    @Column(name = "user_date_of_birth", nullable = false)
    private Date userDateOfBirth;

    @Column(name = "user_joined_date")
    private Date userJoinedDate;

    @Size(min = 6, max = 20, message = "{user.username.lenErr}")
    @Column(name = "user_username", nullable = false, length = 20)
    private String userUsename;

//    @Size(min = 6, max=20, message = "{user.password.lenErr}")
    @Column(name = "user_password", nullable = false)
    private String userPassword;

    @Column(name = "user_is_active")
    private Boolean userIsActive;

    @Column(name = "user_role", length = 20)
    private String userRole;

    @Column(name = "user_email")
    private String userEmail;

    @Size(min = 1, max = 255, message = "{user.address.lenErr}")
    @Column(name = "user_address")
    private String userAddress;

    @Transient
    private String userDistrict;

    @Size(min = 1, max = 50, message = "{user.commune.null}")
    @Transient
    private String userCommune;
    
     @Transient
    private String userCity;

    @Column(name = "user_image", nullable = false)
    private String userImage;

    @Transient
    private MultipartFile file;

//    @Size(min = 6, max=20, message = "{user.password.lenErr}")
    @Transient
    private String confirmPassword;

    @Size(min = 10, max = 10, message = "{user.birthDay.err}")
    @Transient
    private String dob;
    @Transient
    private String jd;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserIdCard() {
        return userIdCard;
    }

    public void setUserIdCard(String userIdCard) {
        this.userIdCard = userIdCard;
    }

    public String getUserPhoneNumber() {
        return userPhoneNumber;
    }

    public void setUserPhoneNumber(String userPhoneNumber) {
        this.userPhoneNumber = userPhoneNumber;
    }

    public Boolean getUserSex() {
        return userSex;
    }

    public void setUserSex(Boolean userSex) {
        this.userSex = userSex;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public String getUserFirstName() {
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getUserUsename() {
        return userUsename;
    }

    public void setUserUsename(String userUsename) {
        this.userUsename = userUsename;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Boolean getUserIsActive() {
        return userIsActive;
    }

    public void setUserIsActive(Boolean userIsActive) {
        this.userIsActive = userIsActive;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserDistrict() {
        return userDistrict;
    }

    public void setUserDistrict(String userDistrict) {
        this.userDistrict = userDistrict;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getUserCommune() {
        return userCommune;
    }

    public void setUserCommune(String userCommune) {
        this.userCommune = userCommune;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    /**
     * @return the userDateOfBirth
     */
    public Date getUserDateOfBirth() {
        return userDateOfBirth;
    }

    /**
     * @param userDateOfBirth the userDateOfBirth to set
     */
    public void setUserDateOfBirth(Date userDateOfBirth) {
        this.userDateOfBirth = userDateOfBirth;
    }

    /**
     * @return the userJoinedDate
     */
    public Date getUserJoinedDate() {
        return userJoinedDate;
    }

    /**
     * @param userJoinedDate the userJoinedDate to set
     */
    public void setUserJoinedDate(Date userJoinedDate) {
        this.userJoinedDate = userJoinedDate;
    }

    /**
     * @return the userAddress
     */
    public String getUserAddress() {
        return userAddress;
    }

    /**
     * @param userAddress the userAddress to set
     */
    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    /**
     * @return the jd
     */
    public String getJd() {
        return jd;
    }

    /**
     * @param jd the jd to set
     */
    public void setJd(String jd) {
        this.jd = jd;
    }

    /**
     * @return the userCity
     */
    public String getUserCity() {
        return userCity;
    }

    /**
     * @param userCity the userCity to set
     */
    public void setUserCity(String userCity) {
        this.userCity = userCity;
    }
}
