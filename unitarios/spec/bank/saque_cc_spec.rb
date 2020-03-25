require_relative '../../app/bank'

describe ContaCorrente do
    describe 'Saque' do
        context 'quando o valor eh positivo' do
            before(:all) do
                @cc = ContaCorrente.new(1000.00)
                @cc.saca(200.00)
            end
            it 'entao atualiza o saldo' do 
               expect(@cc.saldo).to eql 795.00
            end
        end

        context 'quando o saldo é zero' do
            before(:all) do 
                @cc = ContaCorrente.new(0.00)
                @cc.saca(100.00)
            end
            it 'entao exibe mensagem' do
                expect(@cc.mensagem).to eql "Saldo insuficiente para saque :("
            end 
            it 'e o saldo final com zeros' do
                expect(@cc.saldo).to eql 0.00
            end
        end 

        context 'quando o saldo eh insuficiente' do
            before(:all) do 
                @cc = ContaCorrente.new(100.00)
                @cc.saca(101.00)
            end
            it 'entao exibe mensagem' do
                expect(@cc.mensagem).to eql "Saldo insuficiente para saque :("
            end 
            it 'e o saldo permanece' do
                expect(@cc.saldo).to eql 100.00
            end
        end 
        
        context 'quando supera o limite de saque' do
            before(:all) do 
                @cc = ContaCorrente.new(1000.00)
                @cc.saca(701.00)
            end
            it 'entao exibe mensagem' do
                expect(@cc.mensagem).to eql "Limite maximo por saque eh de R$ 700"
            end 
            it 'e o saldo permanece' do
                expect(@cc.saldo).to eql 1000.00
            end
        end  
    end
end