package tpcs.util.crypt;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHAUtil {
    public static String encryptBySHA512(String sourceStr) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-512");
        md.update(sourceStr.getBytes());
        String tempStr;
        StringBuilder stb = new StringBuilder();
        for (byte origByte : md.digest()) {
            tempStr = Integer.toHexString(origByte & 0xff);
            if (tempStr.length() == 1) {
                stb.append("0");
            }
            stb.append(tempStr);
        }
        return stb.toString();
    }
}
