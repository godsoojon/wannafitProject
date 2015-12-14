package common.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

		Pattern p = Pattern.compile(
				"([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])");

		Matcher m = p.matcher(customer.getCsPassword());

		if (!supports(target.getClass())) {
			error.reject("notsupport", "검등할수 없는 객체 입니다.");
		}

//		Matcher m = p.matcher(customer.getCsPassword());
//		if (m.find()) {
//			System.err.println(customer.getCsPassword() + " 은 패턴에 해당함!!!");
//		} else {
//			System.err.println(customer.getCsPassword() + " 은 패턴에 어긋남!!!");
//		}

		if (findcust != null) {
			error.rejectValue("csId", "existCsId");
		}

		if (customer.getCsId().length() < 5) {
			System.err.println(customer.getCsPassword() + " 은 패턴에 해당함!!!");
		}
		if (customer.getCsPassword().length() < 6) {
			error.rejectValue("csPassword", "shortCsPassword");
		}

		if (m.find()) {
			System.err.println(customer.getCsPassword());
		} else {
			System.err.println(customer.getCsPassword() + " 은 패턴에 어긋남!!!");
			error.rejectValue("csPassword", "inappropriatePwd");
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
