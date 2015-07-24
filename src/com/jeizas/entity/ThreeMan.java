package com.jeizas.entity;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Table(name="threeman",catalog="buildingsafety")
@Entity
public class ThreeMan implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String name;
	private String certificate;//证书id
	private DomainValue type;//类型
	private String companyid;//公司id
	private String indefication;//身份证
	private String sex;//性别
	private Date birthday;//出生日期
	private String duty;//职务
	private String title;//职称
	private String degress;//学位
	private Date issus_date;//发证时间
	private Date start_date;//有效期起
	private Date final_date;//有效期止
	private String authority;//发证机关
	
	@Id
	@GenericGenerator(name = "generator", strategy="increment")//增加时如果没有id则主键自增
	@GeneratedValue(generator = "generator")//和上面一行配合使用
	@Column(name = "ID", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="NAME",length=50)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="CERTIFICATEID",length=50)
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	@ManyToOne
	@JoinColumn(name="TYPE")
	public DomainValue getType() {
		return type;
	}
	public void setType(DomainValue type) {
		this.type = type;
	}
	@Column(name="COMPANYID",length=36)
	public String getCompanyid() {
		return companyid;
	}
	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}
	@Column(name="IDENTIFICATION",length=18)
	public String getIndefication() {
		return indefication;
	}
	public void setIndefication(String indefication) {
		this.indefication = indefication;
	}
	@Column(name="SEX",length=1)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	@Column(name="BIRTHDAY")
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday){
		this.birthday = birthday;
	}
	/*public void setBirthday(String birthday) throws ParseException {//reload set
		System.out.println("dddddddddddd");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		this.birthday = (Date) sdf.parse(birthday);
	}*/
	@Column(name="DUTY",length=20)
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	@Column(name="TITLE",length=10)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name="DEGRESS",length=36)
	public String getDegress() {
		return degress;
	}
	public void setDegress(String degress) {
		this.degress = degress;
	}
	/*@Temporal(TemporalType.DATE)*/
	@Column(name="ISSUE_DATE")
	public Date getIssus_date() {
		return issus_date;
	}
	public void setIssus_date(Date issus_date) {
		this.issus_date = issus_date;
	}
	/*public void setIssus_date(String issus_date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		this.issus_date = (Date) sdf.parse(issus_date);
	}*/
	/*@Temporal(TemporalType.DATE)*/
	@Column(name="START_DATE")
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date){
		this.start_date = start_date;
	}
	/*public void setStart_date(String start_date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		this.start_date = sdf.parse(start_date);
	}*/
	/*@Temporal(TemporalType.DATE)*/
	@Column(name="FINAL_DATE")
	public Date getFinal_date() {
		return final_date;
	}
	public void setFinal_date(Date final_date){
		this.final_date = final_date;
	}
	/*public void setFinal_date(String final_date) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		this.final_date = sdf.parse(final_date);
	}*/
	@Column(name="AUTHORITY",length=200)
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public ThreeMan() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ThreeMan [id=" + id + ", name=" + name + ", certificate="
				+ certificate + ", type=" + type + ", companyid=" + companyid
				+ ", indefication=" + indefication + ", sex=" + sex
				+ ", birthday=" + birthday + ", duty=" + duty + ", title="
				+ title + ", degress=" + degress + ", issus_date=" + issus_date
				+ ", start_date=" + start_date + ", final_date=" + final_date
				+ ", authority=" + authority + "]";
	}
	
	
}
