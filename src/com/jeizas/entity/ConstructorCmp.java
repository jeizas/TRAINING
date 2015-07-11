package com.jeizas.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Table(name="contructorcmp",catalog="bulidingsafety")
public class ConstructorCmp {

	private Integer id;
	private String name;//建筑公司名字
	private String safeid;//安全生产证
	private Date issueDate;//发证日期
	private String econemictype;//经济实体
	
	@Id
	@GenericGenerator(name = "generator", strategy = "native")//增加时如果没有id则主键自增
	@GeneratedValue(generator = "generator")//和上面一行配合使用
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="NAME",length=50)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name="SAFEID",length=50)
	public String getSafeid() {
		return safeid;
	}
	public void setSafeid(String safeid) {
		this.safeid = safeid;
	}
	
	@Column(name="ISSUEDATE")
	public Date getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	@Column(name="ECONEMICTYPE",length=50)
	public String getEconemictype() {
		return econemictype;
	}
	public void setEconemictype(String econemictype) {
		this.econemictype = econemictype;
	}
	public ConstructorCmp() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ConstructorCmp(Integer id, String name, String safeid,
			Date issueDate, String econemictype) {
		super();
		this.id = id;
		this.name = name;
		this.safeid = safeid;
		this.issueDate = issueDate;
		this.econemictype = econemictype;
	}
	
	
}
