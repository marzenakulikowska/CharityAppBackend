package pl.coderslab.charity.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Controller
public class DonationController {
    //Rolą kontrolera będzie wyświetlenie oraz obsługa formularza dodawania darów.
    //lista category i institution
    private final DonationRepository donationRepository;
    private final InstitutionRepository institutionRepository;
    private final CategoryRepository categoryRepository;
    public DonationController(DonationRepository donationRepository, InstitutionRepository institutionRepository, CategoryRepository categoryRepository) {
        this.donationRepository = donationRepository;
        this.institutionRepository = institutionRepository;
        this.categoryRepository = categoryRepository;
    }
    //FORMULARZ DODAWANIA DARÓW
    @RequestMapping(value = "/form")
    public String getFormDonation(Model model) {
        Donation donation = new Donation();
        model.addAttribute("donation", donation);
        //lista kategorii
        List<Category> categoryList = categoryRepository.findAll();
        model.addAttribute("categoryList", categoryList);
        //lista fundacji
        List<Institution> institutions = institutionRepository.findAll();
        model.addAttribute("institutions", institutions);
        return "form";
    }
    //ZAPIS DO BAZY DANYCH DONATION
    @RequestMapping(value = "/form", method = RequestMethod.POST)
    public String postDonation(Donation donation) {
        donationRepository.save(donation);
        return "index";
    }

}
