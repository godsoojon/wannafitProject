package common.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.customer.service.HealthService;
import com.wannafitshare.vo.Health;

public class HealthValidator implements Validator{

	@Autowired
	private HealthService service;
	
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return clazz.isAssignableFrom(Health.class);
	}

	@Override
	// 등록/수정 공통 체크.
	public void validate(Object target, Errors error) {
		ValidationUtils.rejectIfEmptyOrWhitespace(error, "", "required", new Object[] { "고객 ID" }, "필수입력사항입니다.");
		Health health =(Health)target;
		
		
		
		if (!supports(target.getClass())) {
			error.reject("notsupport", "검증할수 없는 객체 입니다.");
		}
		
		
		
	}
}
