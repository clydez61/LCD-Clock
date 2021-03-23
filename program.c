/* 
 * File:   lab3.c
 * Author: zhouc
 * library functions belongs to this website:
 * https://www.aeq-web.com/atmega328-4bit-16x2-lcd-display-amtel-studio-c/?lang=en
 * Created on November 15, 2020, 4:58 PM
 */
#define F_CPU 8000000UL
#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#define LCD_Port PORTD			//Define LCD Port (PORTA, PORTB, PORTC, PORTD)
#define LCD_DPin  DDRD			//Define 4-Bit Pins (PD4-PD7 at PORT D)
#define RSPIN PD0			//RS Pin
#define ENPIN PD1 			//E Pin


void LCD_Init (void)
{
	LCD_DPin = 0xFF;		//Control LCD Pins (D4-D7)
	_delay_ms(15);		//Wait before LCD activation
	LCD_Action(0x02);	//4-Bit Control
	LCD_Action(0x28);       //Control Matrix @ 4-Bit
	LCD_Action(0x0c);       //Disable Cursor
	LCD_Action(0x06);       //Move Cursor
	LCD_Action(0x01);       //Clean LCD
	_delay_ms(2);
}

void LCD_Action( unsigned char cmnd )
{
	LCD_Port = (LCD_Port & 0x0F) | (cmnd & 0xF0);
	LCD_Port &= ~ (1<<RSPIN);
	LCD_Port |= (1<<ENPIN);
	_delay_ms(1);
	LCD_Port &= ~ (1<<ENPIN);
	_delay_us(200);
	LCD_Port = (LCD_Port & 0x0F) | (cmnd << 4);
	LCD_Port |= (1<<ENPIN);
	_delay_us(1);
	LCD_Port &= ~ (1<<ENPIN);
	_delay_ms(2);
}

void LCD_Clear()
{
	LCD_Action (0x01);		//Clear LCD
	_delay_ms(2);			//Wait to clean LCD
	LCD_Action (0x80);		//Move to Position Line 1, Position 1
}


void LCD_Print (char *str)
{
	int i;
	for(i=0; str[i]!=0; i++)
	{
		LCD_Port = (LCD_Port & 0x0F) | (str[i] & 0xF0);
		LCD_Port |= (1<<RSPIN);
		LCD_Port|= (1<<ENPIN);
		_delay_us(1);
		LCD_Port &= ~ (1<<ENPIN);
		_delay_us(200);
		LCD_Port = (LCD_Port & 0x0F) | (str[i] << 4);
		LCD_Port |= (1<<ENPIN);
		_delay_us(1);
		LCD_Port &= ~ (1<<ENPIN);
		_delay_ms(2);
	}
}
//Write on a specific location
void LCD_Printpos (char row, char pos, char *str)
{
	if (row == 0 && pos<16)
	LCD_Action((pos & 0x0F)|0x80);
	else if (row == 1 && pos<16)
	LCD_Action((pos & 0x0F)|0xC0);
	LCD_Print(str);
}
void init(){
    TCCR1B |= (1 << WGM12);
    TIMSK0 |= (1 << OCIE0A);
    OCR1A = 0x0100;
    TCCR1B |= ((1 << CS10) & (1 << CS12));
    sei();
    }

int hh = 1;
int mm = 0;
int ss = 50;
char *time = "    00:00:00 ";
char *button = "  Press Button  ";




int main() {

    DDRB &= (1 << PB1);
    PORTB |= (1 << PB1);
     DDRB &= (1 << PB2);
    PORTB |= (1 << PB2);
      DDRB &= (1 << PB0);
    PORTB |= (1 << PB0);

    LCD_Init();         //Activate LCD.
    LCD_Print(time);    //Begin writing at Line 1, Position 1.
    LCD_Action(0xC0);   //Moves cursor to line 2 position 1.
    LCD_Print(button);  //Writes the string stored in button.

    while(1) {
        char buffer[16];
//        itoa(ss,buffer,10);
//        LCD_Action(0x80);
//        LCD_Printpos(0,10,buffer);
        
        
        if (ss < 10){
            itoa(ss,buffer,10);
            LCD_Action(0x80);
            LCD_Printpos(0,10,"0");
            LCD_Printpos(0,11,buffer);
            _delay_ms(1000);
            ss++;
        } else if (ss >= 10 && ss <60){
            itoa(ss,buffer,10);
            LCD_Action(0x80);
            LCD_Printpos(0,10,buffer);
             _delay_ms(1000);
            ss++;
        }      else if (ss == 60 && mm <10){
            ss = 0;  
            itoa(mm,buffer,10);
            LCD_Action(0x80);
            LCD_Printpos(0,7,"0");
            LCD_Printpos(0,8,buffer);
            ++mm;
        } else if (ss = 60 && mm >=10 && mm <60){
            ss= 0;
            itoa(mm,buffer,10);
            LCD_Action(0x80);
            LCD_Printpos(0,7,buffer);
            mm++;
        }
            else if (mm ==60 && hh<10){
               mm= 0;
            itoa(hh,buffer,10);
            LCD_Action(0x80);  
            LCD_Printpos(0,4,"0");
            LCD_Printpos(0,5,buffer);
            ++hh;
            } else if ((hh >=10) && (hh < 24) && (mm ==60) && (ss = 60)){
            itoa(hh,buffer,10);
            LCD_Action(0x80);  
            LCD_Printpos(0,4,buffer);
            ++hh;
            } 
            else if (hh >= 24 && mm == 60 && ss == 60){
              hh=0;
            itoa(hh,buffer,10);
            LCD_Action(0x80);  
            LCD_Printpos(0,4,buffer);
            }            
            
            
            
        if (!(PINB & (1 << PORTB1))){
            LCD_Action(0xC0);
            LCD_Print(" set time with");
            _delay_ms(2000);
            LCD_Action(0xC0);
            LCD_Print(" the 2 buttons");
            _delay_ms(2000);
            LCD_Action(0xC0);
            LCD_Print("  near power  ");
            _delay_ms(2000);
            LCD_Action(0xC0);
            LCD_Print(" the left one");
            _delay_ms(2000);
            LCD_Action(0xC0);
            LCD_Print(" for +1 minute");
             _delay_ms(2000);
            LCD_Action(0xC0);
            LCD_Print(" the right one");
            _delay_ms(2000);
            LCD_Action(0xC0);
            LCD_Print(" for +1 hour  ");
             _delay_ms(2000);
            LCD_Action(0xC0);
            LCD_Print("  Press Button  ");
        }
     if (!(PINB & (1 << PORTB2))){
         _delay_ms(10);
         if (mm < 10){            
         itoa(mm,buffer,10);
            LCD_Action(0x80);
            LCD_Printpos(0,7,"0");
            LCD_Printpos(0,8,buffer);
            ++mm;
         } else if (mm >=10 && mm <60){
           
            itoa(mm,buffer,10);
            LCD_Action(0x80);
            LCD_Printpos(0,7,buffer);   
              ++mm;
         } else if (mm == 60){
             mm = 0;
            itoa(hh,buffer,10);
            LCD_Action(0x80);
            LCD_Printpos(0,4,"0");
            LCD_Printpos(0,5,buffer);
            ++hh;
             
         }
     }
          if (!(PINB & (1 << PORTB0))){
         _delay_ms(10);
         if (hh<10){             
            itoa(hh,buffer,10);
            LCD_Action(0x80);  
            LCD_Printpos(0,4,"0");
            LCD_Printpos(0,5,buffer);
            ++hh;
            } else if ((hh >=10) && (hh < 24)){
            itoa(hh,buffer,10);
            LCD_Action(0x80);  
            LCD_Printpos(0,4,buffer);
            ++hh;
            } 
            else if (hh >= 24){
              hh=0;
            itoa(hh,buffer,10);
            LCD_Action(0x80);  
            LCD_Printpos(0,4,"0");
            LCD_Printpos(0,5,buffer);
            ++hh;
            }        
             
         }
         }
       
     }
    




    

