package com.test.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "coffee")	//MariaDB의 coffee 테이블
public class Coffee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;			//커피 id
	private int flag;		//삭제를 위한 flag
	private String name;	//커피 이름
	private int inven;		//커피 재고
	private int price;		//커피 가격
	private int totamount;	//커피 총판매량
	private int totsale;	//커피 총판매액

	@CreationTimestamp
	@Column(name = "regdate", nullable = false, updatable = false)
	private Timestamp regdate;

	@UpdateTimestamp
	private Timestamp moddate;

	public int getTotamount() {
		return totamount;
	}

	public void setTotamount(int totamount) {
		this.totamount = totamount;
	}

	public int getTotsale() {
		return totsale;
	}

	public void setTotsale(int totsale) {
		this.totsale = totsale;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getModdate() {
		return moddate;
	}

	public void setModdate(Timestamp moddate) {
		this.moddate = moddate;
	}

	@Override
	public String toString() {
		return name + " [id=" + id + "name=" + name + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getInven() {
		return inven;
	}

	public void setInven(int inven) {
		this.inven = inven;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}
}


