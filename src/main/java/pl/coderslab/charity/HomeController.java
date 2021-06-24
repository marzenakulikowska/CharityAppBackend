package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.repository.DonationRepository;


@Controller
public class HomeController {
@Autowired
DonationRepository donationRepository;
    @RequestMapping("/")
    public String homeAction(Model model){

        return "index";
    }
}
