package common.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.vo.Customer;

@Component
public class RemoveValidator implements Validator {

	@Autowired
	private CustomerService service;

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(Customer.class);
	}

	@Override
	public void validate(Object target, Errors error) {
		Customer reCust = (Customer) target;
		Customer findcust = service.findCustomerById(reCust.getCsId());

		if (!supports(target.getClass())) {
			error.reject("notsupport", "검증할수 없는 객체 입니다.");
		}

		if (!reCust.getCsPassword().equals(findcust.getCsPassword())) {
			error.rejectValue("csPassword", "wrongPwd");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csPassword",
				"loginRequired", new Object[] { "패스워드" }, "패스워드를 확인하세요.");
	}
}
