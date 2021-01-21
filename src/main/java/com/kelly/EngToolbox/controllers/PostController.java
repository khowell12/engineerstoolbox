package com.kelly.EngToolbox.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kelly.EngToolbox.models.Discussion;
import com.kelly.EngToolbox.models.UMsg;
import com.kelly.EngToolbox.models.User;
import com.kelly.EngToolbox.services.DiscussionService;
import com.kelly.EngToolbox.services.UMsgService;
import com.kelly.EngToolbox.services.UserService;

@Controller
public class PostController{

	@Autowired
	private DiscussionService discServ;
	@Autowired
	private UMsgService msgServ;
	@Autowired
	private UserService uServ;
	
	@PostMapping("/discussion")
	public String postDiscussion(@Valid @ModelAttribute("discusison") Discussion disc, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			//return page you were on by using topic
			return "/" + disc.getTopic();
		}
		else {
			this.discServ.createDiscussion(disc);
			return "redirect:/" + disc.getTopic();
		}
	}
	@RequestMapping("/{topic}/{id}")
	public String showTopic(HttpSession session, @PathVariable("topic") String topic, @PathVariable("id") Long id, @ModelAttribute("umsg") UMsg message, Model viewModel) {
		if(session.getAttribute("user_id") != null) {
		User u = uServ.findUserById((Long) session.getAttribute("user_id"));
		viewModel.addAttribute("user", u);
		}
		Discussion d = this.discServ.findByTopicAndId(topic, id);
		viewModel.addAttribute("discussion", d);
		List<UMsg> m = this.msgServ.allByDiscussion(d);
		viewModel.addAttribute("messages", m);
		return "discussionPost.jsp";
	}
	@PostMapping("/msg")
	public String postMsg(@Valid @ModelAttribute("msg") UMsg msg, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:/" + msg.getDiscussion().getTopic() + "/" + msg.getDiscussion().getId();
		}
		else {
			this.msgServ.createMessage(msg);
			return "redirect:/" + msg.getDiscussion().getTopic() + "/" + msg.getDiscussion().getId();
		}
	}
	@Transactional
	@GetMapping("/delete/{topic}/{id}")
		public String deleteDiscussion(@PathVariable("topic") String topic, @PathVariable("id") Long id) {
			this.discServ.deleteByTopicAndId(topic, id);
			return "redirect:/" + topic;
		}

}
