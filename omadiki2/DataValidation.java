package omadiki2;

public class DataValidation {


	public boolean isTextValid(String text) {

		return (text == null || text.length() < 2 ? false : true);

	}

	public boolean isPasswordValid(String password) {

			return (password == null || password.length() < 6 ? false : true);

	}

	public boolean samePassword(String password1, String password2) {

		String empty = new String();
		if(password1.equals(password2)&& (!password1.equals(empty) )) {
			return true;
		}

		return false;
	}

	public boolean isValidEmailAddress(String email) {

		//Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);

        return m.matches();
	}

	public boolean checkBox(Boolean answer) {
		if((answer)==null)
						{
							return false;
						}


				return true;

	}





	public DataValidation() {

	}

}
