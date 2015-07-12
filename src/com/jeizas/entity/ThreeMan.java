package com.jeizas.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Table(name="threeman",catalog="buildingsafety")
@Entity
public class ThreeMan {
	private int id;
	private String name;
	private String certificate;//֤��id
	private String type;//����
	private String companyid;//��˾id
	private String indefication;//���֤
	private String sex;//�Ա�
	private Date birthday;//��������
	private String duty;//ְ��
	private String title;//ְ��
	private String degress;//ѧλ
	private Date issus_date;//��֤ʱ��
	private Date start_date;//��Ч����
	private Date final_date;//��Ч��ֹ
	private String authority;//��֤����
	
	@Id
	@GenericGenerator(name = "generator", strategy = "native")//����ʱ���û��id����������
	@GeneratedValue(generator = "generator")//������һ�����ʹ��
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
	@Column(name="TYPE",length=1)
	public String getType() {
		return type;
	}
	public void setType(String type) {
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
	/*@JSON(format="yyyy-MM-dd")*/
	/*@Temporal(TemporalType.DATE)*/
	@Column(name="BIRTHDAY")
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
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
	/*@Temporal(TemporalType.DATE)*/
	@Column(name="START_DATE")
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	/*@Temporal(TemporalType.DATE)*/
	@Column(name="FINAL_DATE")
	public Date getFinal_date() {
		return final_date;
	}
	public void setFinal_date(Date final_date) {
		this.final_date = final_date;
	}
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
