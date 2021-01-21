package com.kelly.EngToolbox.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kelly.EngToolbox.models.Discussion;
import com.kelly.EngToolbox.repositories.DiscussionRepository;

@Service
public class DiscussionService{
	@Autowired
	private DiscussionRepository discRepo;
	
	
	//create
	public Discussion createDiscussion(Discussion disc) {
		return this.discRepo.save(disc);
	}
	//read
	public List<Discussion> findAllDiscussionbyTopic(String topic){
		return this.discRepo.findAllByTopic(topic);
	}
	public Discussion findByTopicAndId(String topic, Long id) {
		return this.discRepo.findByTopicAndId(topic, id);
	}
	//update
	//delete
	public void deleteByTopicAndId(String topic, Long id) {
		this.discRepo.deleteByTopicAndId(topic, id);
		
	}
	public void deleteDiscussionById(Long id) {
		this.discRepo.deleteById(id);
	}
}