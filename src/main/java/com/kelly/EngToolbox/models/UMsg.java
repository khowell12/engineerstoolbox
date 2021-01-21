package com.kelly.EngToolbox.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.validation.constraints.NotBlank;

@Entity
public class UMsg{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank
	private String content;
	@ManyToOne(fetch = FetchType.EAGER) //get all messages for a discussion post
	@JoinColumn(name="title_id")
	private Discussion discussion;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User msgPoster;
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	public UMsg() {
		
	}
	@PrePersist
	public void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	public void onUpdate() {
		this.updatedAt = new Date();
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public User getMsgPoster() {
		return msgPoster;
	}
	public void setMsgPoster(User msgPoster) {
		this.msgPoster = msgPoster;
	}
	public Discussion getDiscussion() {
		return discussion;
	}
	public void setDiscussion(Discussion discussion) {
		this.discussion = discussion;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
}