package com.jeizas.entity;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Table(name="demianvalue",catalog="buildingsafety")
@Entity
public class DomainValue {
	private String id;
	private String value;
	

	@Id
	@GenericGenerator(name = "generator", strategy="increment")//����ʱ���û��id����������
	@GeneratedValue(generator = "generator")//������һ�����ʹ��
	@Column(name = "ID", unique = true, nullable = false)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column(name="value",length=20)
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
}
