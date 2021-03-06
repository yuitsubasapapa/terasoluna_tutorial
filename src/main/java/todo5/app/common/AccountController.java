
package todo5.app.common;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import todo5.app.modal.ModalForm;
import todo5.domain.model.UserAccount;
import todo5.domain.service.common.LoginUserAccount;

@Controller
@RequestMapping("accountInfoView")
public class AccountController {
    
    @ModelAttribute
    public ModalForm setUpForm() {
        ModalForm form = new ModalForm();
        return form;
    }
    
    @RequestMapping
    public String view(
            @AuthenticationPrincipal LoginUserAccount loginUserAccount, Model model) {

        UserAccount userAccount = loginUserAccount.getUserAccount();
        model.addAttribute(userAccount);
        return "account/view";
    }
}
