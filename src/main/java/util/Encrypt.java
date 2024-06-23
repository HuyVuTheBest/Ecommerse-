package util;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encrypt {
	
	public static String encryptSHA1(String input) {
        try {
        	
        	String salt ="lkmsdll.qw/';;s.d;l,wldmnjsndlkasdoko22221421";
            String saltedInput = input + salt;
            
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            
            byte[] encodedHash = digest.digest(saltedInput.getBytes());
            
            StringBuilder hexString = new StringBuilder();
            for (byte hashByte : encodedHash) {
                String hex = Integer.toHexString(0xff & hashByte);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
	
	 private static boolean login(String username, String password, String hashedPassword) {
	        if (username.equals("admin")) {
	            String encryptedPassword = encryptSHA1(password);
	            return encryptedPassword.equals(hashedPassword);
	        } else {
	            return false;
	        }
	    }
	

    public static void main(String[] args) {
    	
    	String hashed ="8ffb6270c9d9346d1bd5c60d222a322b38dceb23";
    	
        String input = "14241";
        String hashedOutput = encryptSHA1(input);
        System.out.println("Mã hóa SHA-1 của \"" + input + "\": " + hashedOutput);
        
        String inputUsername = "admin";
        String inputPassword = "14241";
        if (login(inputUsername, inputPassword, hashed)) {
            System.out.println("Đăng nhập thành công!");
        } else {
            System.out.println("Đăng nhập thất bại. Tên đăng nhập hoặc mật khẩu không đúng.");
        }
    }
}
