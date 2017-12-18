package techproject.forum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/security")
public class SecurityController {

    @RequestMapping("/login")
    public String login(Model model) {
        return "/security/login";
    }
}
