package techproject.forum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@Autowired
	TopicController topicController;

    @RequestMapping("/")
    public String index(Model model) {
        return this.topicController.list(model);
    }
}
