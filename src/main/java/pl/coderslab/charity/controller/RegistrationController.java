package pl.coderslab.charity.controller;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;

import javax.validation.Valid;

@Controller
public class RegistrationController {

    private static final Logger log = LoggerFactory.getLogger(RegistrationController.class);
    private final UserRepository userRepository;

    public RegistrationController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    //FORMULARZ DODAWANIA UŻYTKOWNIKÓW
    @GetMapping("/register")
    public String getRegistrationForm(Model model) {
        User user = new User();
        model.addAttribute("userRegister", user);

        return "register";
    }
    //ZAPIS UŻYTKOWNIKA DO BAZY
    @PostMapping("/register")
    public String register(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "register";
        }
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String encodePassword = bCryptPasswordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        userRepository.save(user);
        return "redirect:/login";
    }
}