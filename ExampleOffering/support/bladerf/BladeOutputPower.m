addpath('C:\Program Files\bladeRF\matlab');

%dev = bladeRF();

%bladeRF_rx_gui;

clear;

fprintf('\nWelcome to the BladeRF Power Exhibitor 9000\nShould you have any questions, please do not consult the help file.\nThis MATLAB program has not been tested or validated by the FCC to be safe for human consumption. Or use.\nHappy Hacking!\n      -Rick Ley\n\n');
fprintf('**********\n');

try
    dev = bladeRF();
catch ME
    if(strfind(ME.message, 'error (-7)'))
        fprintf(ME.message);
        fprintf('\n ***\n## Did you remember to plug it in? ##\n');
        return;
    end
end

%%
% equation is: output power = -15 + vga1 + vga2
fc = 915e6;
fs = 10e6;
bw = 1e6;

vga1 = -15;
vga2 = 25;

%pw = 0.88274 * vga2 + (vga1 -14.1670);
while(1)
    pw = input('Enter power in dBm (leave blank to exit):');
    %pw = str2num(strPow);
    if isempty(pw)
        break;
    end

    if (pw < -28) || (pw > -8)
        fprintf('I''m sorry, but that is out of range.\nPlease provide a power level bewteen -28 and -8 dBm\n');
       continue;
    end
    
    % calculate new power level
    vga2 = (pw - (vga1 -14.1670))/0.88274;
    
    dev.tx.stop();
    dev.tx.frequency = fc;
    dev.tx.samplerate = fs;
    dev.tx.bandwidth = bw;

    dev.tx.vga1 = vga1; % max of -4, min of -25
    dev.tx.vga2 = vga2; % max of 25, min of 0

    dev.tx.config.num_buffers = 64;
    dev.tx.config.buffer_size = 16384;
    dev.tx.config.num_transfers = 16;

    dev.tx.start();
    dev.transmit(ones(fs,1));
end

%%
fprintf('**********\n');
fprintf('**********\n');
fprintf('Thanks, and remember to drink your Ovaltine!\n\n')
dev.tx.stop();
clear('dev');
