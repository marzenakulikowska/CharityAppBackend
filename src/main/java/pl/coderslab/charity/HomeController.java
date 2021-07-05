package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.ArrayList;
import java.util.List;


@Controller

public class HomeController {

    private final DonationRepository donationRepository;
    private final InstitutionRepository institutionRepository;
    private final CategoryRepository categoryRepository;

    public HomeController(DonationRepository donationRepository, InstitutionRepository institutionRepository, CategoryRepository categoryRepository) {
        this.donationRepository = donationRepository;
        this.institutionRepository = institutionRepository;
        this.categoryRepository = categoryRepository;
    }

    @RequestMapping("/")
    public String homeAction(Model model) {
        //nowa lista z 2 institution
        //lista fundacji
        //List<ArrayList> newList = new ArrayList<>();
        List<Institution> institutions = institutionRepository.findAll();
//        int size = institutions.size();
//        for (int i =0; i < size; i++) {
//            newList.add(institutions);
//        }
        model.addAttribute("institutions", institutions);
        //ilość przekazanych darów
        int countDonations = donationRepository.countDonations();
        model.addAttribute("countDonations", countDonations);
        //ilość oddanych worków
        int sumQuantityDonations = donationRepository.sumQuantityDonations();
        model.addAttribute("sumQuantityDonations", sumQuantityDonations);
        return "index";
    }
}
