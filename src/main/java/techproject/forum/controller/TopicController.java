package techproject.forum.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import techproject.forum.model.Topic;
import techproject.forum.service.TopicService;

@Controller
@RequestMapping("/topic")
public class TopicController {
	
	@Autowired
	TopicService topicService;

    @RequestMapping("/list")
    public String list(Model model) {
    	
    		List<Topic> topics = this.topicService.findAll("CREATED desc");
    		model.addAttribute("topics", topics);

        return "/topic/list";
    }
    
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String search(
    		@RequestParam("search") String search,
    		Model model) {
    	
    		List<Topic> topics = this.topicService.findAll(search, "CREATED desc");
    		model.addAttribute("topics", topics);
    		model.addAttribute("search", search);

        return "/topic/list";
    }
    
    @RequestMapping("/view/{id}")
    public String view(
    		@PathVariable("id") long id,
    		Model model) {
    	
    		Topic topic = this.topicService.find(id);
    		model.addAttribute("topic", topic);
    	
        return "/topic/view";
    }
    
    @Secured("ROLE_USER")
    @RequestMapping("/new")
    public String newTopic() {
        return "/topic/new";
    }
    
    @Secured("ROLE_USER")
    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String saveTopic(
    		@RequestParam("headline") String headline,
    		@RequestParam("text") String text,
    		Model model) {
    	
	    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

    		Topic topic = new Topic();
    		topic.setHeadline(headline);
    		topic.setText(text);
		topic.setAuthor(authentication.getName().toLowerCase());
		topic.setCreated(new Date());
		
		topicService.create(topic);
    	
    		return this.list(model);
    }
    
    @Secured("ROLE_USER")
    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String saveTopic(
    		@RequestParam("text") String text,
    		@RequestParam("topic") long topic,
    		Model model) {
    	
    		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

    		this.topicService.post(text, authentication.getName().toLowerCase(), topic);
    	
    		return this.view(topic, model);
    }
}
