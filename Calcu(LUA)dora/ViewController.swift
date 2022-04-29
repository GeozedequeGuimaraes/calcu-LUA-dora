import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var resultadoCircunfLabel: UILabel!
    @IBOutlet var resultadoDiametroLabel: UILabel!
    @IBOutlet var resultadoAreaLabel: UILabel!
    @IBOutlet var resultadoRaioLabel: UILabel!
    @IBOutlet var tipoEntradatextField: UITextField!
    @IBOutlet var valorEntradaTextField: UITextField!
    
    @IBOutlet var lua1: UIImageView!
    @IBOutlet var luaCincunf: UIImageView!
    @IBOutlet var luaArea: UIImageView!
   
    @IBOutlet var lineVerticalPreto: UIImageView!
    @IBOutlet var lineVerticalAzul: UIImageView!
    @IBOutlet var lineHorizontalPreto: UIImageView!
    @IBOutlet var lineHorizontalAzul: UIImageView!
    
    @IBOutlet var identificadorRaioPreto: UIImageView!
    @IBOutlet var identificadorRaioAzul: UIImageView!
    @IBOutlet var identicicadorCircunfPreto: UIImageView!
    @IBOutlet var identicicadorCircunfAzul: UIImageView!
    @IBOutlet var identicicadorDiametroPreto: UIImageView!
    @IBOutlet var identicicadorDiametroAzul: UIImageView!
    
    var myPickerData: [String] = ["Circunferência", "Diâmetro", "Área", "Raio"]
    var currentIndex = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let thePicker = UIPickerView()
        thePicker.delegate = self
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let btnDone = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closePicker))
        toolBar.setItems([btnDone], animated: true)
        tipoEntradatextField.inputAccessoryView = toolBar
        
        tipoEntradatextField.inputView = thePicker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentIndex = row
        return myPickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipoEntradatextField.text = myPickerData[row]
        
        if tipoEntradatextField.text != "Circunferência" {
            tipoEntradatextField.textAlignment = .center
        }
        
        if tipoEntradatextField.text == "Circunferência"  {
            tipoEntradatextField.textAlignment = .left
        }
        
        if tipoEntradatextField.text == "Circunferência"{
            lua1.isHidden = true
            luaCincunf.isHidden = false
            identicicadorCircunfAzul.isHidden = false
            identicicadorCircunfPreto.isHidden = true
            lineVerticalAzul.isHidden = true
            lineVerticalPreto.isHidden = false
            identicicadorDiametroAzul.isHidden = true
            identicicadorDiametroPreto.isHidden = false
            lineHorizontalPreto.isHidden = false
            lineHorizontalAzul.isHidden = true
            identificadorRaioAzul.isHidden = true
            identificadorRaioPreto.isHidden = false
            luaArea.isHidden = true
        }
        
        else if tipoEntradatextField.text == "Diâmetro" {
            lineVerticalAzul.isHidden = false
            lineVerticalPreto.isHidden = true
            identicicadorDiametroAzul.isHidden = false
            identicicadorDiametroPreto.isHidden = true
            lua1.isHidden = false
            luaCincunf.isHidden = true
            identicicadorCircunfAzul.isHidden = true
            identicicadorCircunfPreto.isHidden = false
            lineHorizontalPreto.isHidden = false
            lineHorizontalAzul.isHidden = true
            identificadorRaioAzul.isHidden = true
            identificadorRaioPreto.isHidden = false
            luaArea.isHidden = true
        }
        
        else if tipoEntradatextField.text == "Raio" {
            lineHorizontalPreto.isHidden = true
            lineHorizontalAzul.isHidden = false
            identificadorRaioAzul.isHidden = false
            identificadorRaioPreto.isHidden = true
            lineVerticalAzul.isHidden = true
            lineVerticalPreto.isHidden = false
            identicicadorDiametroAzul.isHidden = true
            identicicadorDiametroPreto.isHidden = false
            lua1.isHidden = false
            luaCincunf.isHidden = true
            identicicadorCircunfAzul.isHidden = true
            identicicadorCircunfPreto.isHidden = false
            luaArea.isHidden = true
        }
        
        else {
            luaArea.isHidden = false
            lua1.isHidden = true
            lineVerticalAzul.isHidden = true
            lineVerticalPreto.isHidden = false
            identicicadorDiametroAzul.isHidden = true
            identicicadorDiametroPreto.isHidden = false
            luaCincunf.isHidden = true
            identicicadorCircunfAzul.isHidden = true
            identicicadorCircunfPreto.isHidden = false
            lineHorizontalPreto.isHidden = false
            lineHorizontalAzul.isHidden = true
            identificadorRaioAzul.isHidden = true
            identificadorRaioPreto.isHidden = false
        }
    }
    
    @objc func closePicker(){
        tipoEntradatextField.text = myPickerData[currentIndex]
        if tipoEntradatextField.text == "Circunferência"  {
            tipoEntradatextField.textAlignment = .left
        }
        view.endEditing(true)
    }
    
    @IBAction func botaoCalcular() {
        let valorCircunferencia: Double = Double(resultadoCircunfLabel.text!) ?? 0
        let valorDiametro: Double = Double(resultadoDiametroLabel.text!) ?? 0
        let valorArea: Double = Double(resultadoAreaLabel.text!) ?? 0
        let valorRaio: Double = Double(resultadoRaioLabel.text!) ?? 0
        let tipoEntrada: String = String(tipoEntradatextField.text!)
        
        if tipoEntrada == "Raio" {
            let valorRaio: Double = Double(valorEntradaTextField.text!.replacingOccurrences(of: ",", with: ".")) ?? 0
            let resultadoTotal = Calculo(valorRaio: valorRaio, valorCircunferencia: 0, valorDiametro: 0, valorArea: 0)
            
            resultadoCircunfLabel.text = String(format: "%.2f", resultadoTotal.calculoCircunferencia())
            resultadoDiametroLabel.text = String(format: "%.2f", resultadoTotal.calculoDiametro())
            resultadoAreaLabel.text = String(format: "%.2f", resultadoTotal.calculoArea())
            resultadoRaioLabel.text = String(format: "%.2f", resultadoTotal.calculoRaio())
        }
        
        else if tipoEntrada == "Circunferência"{
            let valorCircunferencia: Double = Double(valorEntradaTextField.text!.replacingOccurrences(of: ",", with: ".")) ?? 0
            let resultadoTotal = Calculo(valorRaio: 0, valorCircunferencia: valorCircunferencia, valorDiametro: 0, valorArea: 0)
            
            resultadoCircunfLabel.text = String(format: "%.2f", resultadoTotal.calculoCircunferencia())
            resultadoDiametroLabel.text = String(format: "%.2f", resultadoTotal.calculoDiametro())
            resultadoAreaLabel.text = String(format: "%.2f", resultadoTotal.calculoArea())
            resultadoRaioLabel.text = String(format: "%.2f", resultadoTotal.calculoRaio())
        }
        
        else if tipoEntrada == "Diâmetro"{
            let valorDiametro: Double = Double(valorEntradaTextField.text!.replacingOccurrences(of: ",", with: ".")) ?? 0
            let resultadoTotal = Calculo(valorRaio: 0, valorCircunferencia: 0, valorDiametro: valorDiametro, valorArea: 0)
            
            resultadoCircunfLabel.text = String(format: "%.2f", resultadoTotal.calculoCircunferencia())
            resultadoDiametroLabel.text = String(format: "%.2f", resultadoTotal.calculoDiametro())
            resultadoAreaLabel.text = String(format: "%.2f", resultadoTotal.calculoArea())
            resultadoRaioLabel.text = String(format: "%.2f", resultadoTotal.calculoRaio())
        }
        
        else if tipoEntrada == "Área"{
            let valorArea: Double = Double(valorEntradaTextField.text!.replacingOccurrences(of: ",", with: ".")) ?? 0
            let resultadoTotal = Calculo(valorRaio: 0, valorCircunferencia: 0, valorDiametro: 0, valorArea: valorArea)
            
            resultadoCircunfLabel.text = String(format: "%.2f", resultadoTotal.calculoCircunferencia())
            resultadoDiametroLabel.text = String(format: "%.2f", resultadoTotal.calculoDiametro())
            resultadoAreaLabel.text = String(format: "%.2f", resultadoTotal.calculoArea())
            resultadoRaioLabel.text = String(format: "%.2f", resultadoTotal.calculoRaio())
        }
        
        else {
            let valorArea: Double = Double(valorEntradaTextField.text!.replacingOccurrences(of: ",", with: ".")) ?? 0
            let resultadoTotal = Calculo(valorRaio: 0, valorCircunferencia: 0, valorDiametro: 0, valorArea: 0)
            
            resultadoCircunfLabel.text = String(format: "%.2f", resultadoTotal.calculoCircunferencia())
            resultadoDiametroLabel.text = String(format: "%.2f", resultadoTotal.calculoDiametro())
            resultadoAreaLabel.text = String(format: "%.2f", resultadoTotal.calculoArea())
            resultadoRaioLabel.text = String(format: "%.2f", resultadoTotal.calculoRaio())
        }
    }
    
   
    class Calculo{
        var raio: Double
        var circunferencia: Double
        var diametro: Double
        var area: Double
    
        init(valorRaio:Double, valorCircunferencia:Double, valorDiametro:Double, valorArea:Double){
            raio = valorRaio
            circunferencia = valorCircunferencia
            diametro = valorDiametro
            area = valorArea
        }
        
        func calcular() -> (Double, Double, Double) {
            let circunferencia = calculoCircunferencia()
            let diametro = calculoDiametro()
            let area = calculoArea()
            return (circunferencia, diametro, area)
        }
        
        func calculoCircunferencia() -> Double {
            if raio != 0 {
                let raio = raio
                var circunferencia = 2 * 3.14159265354 * raio
                return circunferencia
            }
            
            else if self.area != 0 {
                let area = area
                var circunferencia = 2 * 3.1415926535 * (area / 3.1415926535).squareRoot()
                return circunferencia
            }
            
            else if self.diametro != 0 {
                let diametro = diametro
                var circunferencia = 3.1415926535 * diametro
                return circunferencia
            }
            
            else {
                return circunferencia
            }
        }
        
        func calculoDiametro() -> Double {
            if raio != 0 {
                let raio = raio
                var diametro = 2 * raio
                return diametro
            }
            
            else if self.area != 0 {
                let area = area
                diametro = 2 * (area / 3.1415926535).squareRoot()
                return diametro
            }
            
            else if self.circunferencia != 0 {
                let circunferencia = circunferencia
                var diametro = circunferencia / 3.1415926535
                return diametro
            }
            
            else {
                return diametro
            }
        }
        
        func calculoArea() -> Double {
            if raio != 0 {
                let raio = raio
                var area = 3.1415926535 * raio * raio
                return area
            }
            
            else if self.circunferencia != 0 {
                let circunferencia = circunferencia
                var area = 3.1415926535 * ((circunferencia / (2 * 3.1415926535)) * (circunferencia / (2 * 3.1415926535)))
                return area
            }
            
            else if self.diametro != 0 {
                let diametro = diametro
                var area = (3.1415926535 * diametro * diametro) / 4
                return area
            }
            
            else {
                let area = area
                print("entrou")
                return area
            }
        }
        
        func calculoRaio() -> Double {
            if area != 0 {
                let area = area
                var raio = (area / 3.1415926535).squareRoot()
                return raio
            }
            
            else if self.circunferencia != 0 {
                let circunferencia = circunferencia
                var raio = circunferencia / (2 * 3.1415926535)
                return raio
            }
            
            else if self.diametro != 0 {
                let diametro = diametro
                var raio = diametro / 2
                return raio
            }
            
            else {
                return raio
            }
        }
    }
    
}



