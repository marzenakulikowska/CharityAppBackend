package pl.coderslab.charity.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.charity.entity.Donation;
import javax.validation.Validator;
import javax.validation.ConstraintViolation;
import java.util.Set;

@Controller
public class ValidationController {
    private final Logger logger = LoggerFactory.getLogger(ValidationController.class);
    private final Validator validator;
    public ValidationController(Validator validator) {
        this.validator = validator;
    }
    @RequestMapping(value = "/validate", method = RequestMethod.GET)
    @ResponseBody
    public String validateDonation() {
        Donation donation = new Donation();
        String output = "";
        Set<ConstraintViolation<Donation>> violations = validator.validate(donation);
        if (!violations.isEmpty()) {
            for (ConstraintViolation<Donation> constraintViolation : violations) {
                //logger.info(constraintViolation.getPropertyPath() + " "
                //      + constraintViolation.getMessage());
                System.out.println(constraintViolation.getPropertyPath() + " "
                        + constraintViolation.getMessage());
                output = output + constraintViolation.getPropertyPath() + " "
                        + constraintViolation.getMessage() + "\n";
            }
        }
        //return "/";
        return output;
        }
//    @RequestMapping(value = "/validate2", method = RequestMethod.GET)
//    @ResponseBody
//    public String validatePalette() {
//        Palette palette = new Palette();
//        String output = "";
//        Set<ConstraintViolation<Palette>> violations = validator.validate(palette);
//        if (!violations.isEmpty()) {
//            for (ConstraintViolation<Palette> constraintViolation : violations) {
//                //logger.info(constraintViolation.getPropertyPath() + " "
//                //      + constraintViolation.getMessage());
//                System.out.println(constraintViolation.getPropertyPath() + " "
//                        + constraintViolation.getMessage());
//                output = output + constraintViolation.getPropertyPath() + " "
//                        + constraintViolation.getMessage() + "\n";
//            }
//        }
//        //return "/";
//        return output;
//    }
}
