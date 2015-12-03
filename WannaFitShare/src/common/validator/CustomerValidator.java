package common.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.vo.Customer;

@Component
public class CustomerValidator implements Validator {

	@Autowired
	private CustomerService service;

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz.isAssignableFrom(Customer.class);
	}

	@Override
	// 등록/수정 공통 체크.
	public void validate(Object target, Errors error) {

		Customer customer = (Customer) target;
		Customer findcust = service.findCustomerById(customer.getCsId());

		if (!supports(target.getClass())) {
			error.reject("notsupport", "검등할수 없는 객체 입니다.");
		}

		if (findcust != null) {
			System.out.println("findcust != null");
			error.rejectValue("csId", "existCsId");
		}

		if (customer.getCsId().length() < 5) {
			System.out.println("customer.getCsId().length() < 5");
			error.rejectValue("csId", "shortCsId");
		}
		if (customer.getCsPassword().length() < 6) {
			System.out.println("customer.getCsPassword().length() < 6");
			error.rejectValue("csPassword", "shortCsPassword");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csId", "required",
				new Object[] { "고객 ID" }, "필수입력사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csPassword",
				"requried", new Object[] { "패스워드" }, "필수입력사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csName", "required",
				new Object[] { "고객 이름" }, "필수입력사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csEmail", "required",
				new Object[] { "이메일주소" }, "필수입력사항입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "csPhone", "required",
				new Object[] { "휴대폰 번호" }, "필수입력사항입니다.");
	}
}
