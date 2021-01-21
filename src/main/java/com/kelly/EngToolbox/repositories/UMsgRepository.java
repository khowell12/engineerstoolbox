package com.kelly.EngToolbox.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kelly.EngToolbox.models.Discussion;
import com.kelly.EngToolbox.models.UMsg;

@Repository
public interface UMsgRepository extends CrudRepository<UMsg, Long>{
	
	List<UMsg> findAllByDiscussion(Discussion discussion);
}