package common.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.wannafitshare.vo.Customer;

public class LoginValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(Customer.class);
	}

	@Override
	public void validate(Object target, Errors error) {
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csId", "loginRequired",
				new Object[] { "고객 ID" }, "사용할수 없습니다");
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csPassword",
				"loginRequired", new Object[] { "패스워드" }, "없습니다.");

	}
}
