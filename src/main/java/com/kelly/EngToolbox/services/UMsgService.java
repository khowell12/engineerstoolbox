package com.kelly.EngToolbox.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kelly.EngToolbox.models.Discussion;
import com.kelly.EngToolbox.models.UMsg;
import com.kelly.EngToolbox.repositories.UMsgRepository;

@Service
public class UMsgService{
	
	@Autowired
	private UMsgRepository mRepo;
	//create
	public UMsg createMessage(UMsg msg) {
		return mRepo.save(msg);
	}
	//read
	public List<UMsg> allByDiscussion(Discussion discussion){
		return mRepo.findAllByDiscussion(discussion);
	}
		// find by user
	
	//update
	public UMsg editMsg(UMsg msg) {
		return mRepo.save(msg);
	}
	//delete
	public void deleteMsgById(Long id) {
		 mRepo.deleteById(id);
	}
	
}