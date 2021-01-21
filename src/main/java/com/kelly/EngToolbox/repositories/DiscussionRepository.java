package com.kelly.EngToolbox.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kelly.EngToolbox.models.Discussion;

@Repository
public interface DiscussionRepository extends CrudRepository<Discussion, Long>{
	List<Discussion> findAllByTopic(String topic);
	
	Discussion findByTopicAndId(String topic, Long id);
	
	void deleteByTopicAndId(String topic, Long id);
}