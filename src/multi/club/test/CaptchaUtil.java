package multi.club.test;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import jj.play.ns.nl.captcha.Captcha;

public class CaptchaUtil {
	public static String writeImage( HttpServletResponse response ) 
		throws IOException
	{
		Captcha captcha = new Captcha.Builder(160, 40)
			.addText().addBackground().addNoise().addBorder().build();	
		BufferedImage img = captcha.getImage();
		
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "private,no-cache,no-store");
        response.setContentType("image/png");
        
        OutputStream out = response.getOutputStream();
        ImageIO.write(img, "png", out);
        out.close();
        
        return captcha.getAnswer();
	}
}