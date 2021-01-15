//
//  ViewController.swift
//  Assignment7
//
//  Created by Adriano Gaiotto de Oliveira on 2021-01-14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    let statusBar = UIView()
    
    let listView = UIView()
       
    let plusButton = UIButton(type: .system)
    
    let exitButton = UIButton(type: .system)
    
    let rotateTransform45 = CGAffineTransform(rotationAngle: ((.pi / 2) / 2))
    
    let rotateTransform180 = CGAffineTransform(rotationAngle: .pi)
    
    let titleBar = UILabel()
    
    var menuProduct = UIStackView()
    
    var tableProduct = UITableView()
    
    var listProduct: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // model device
        // print(ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"])
        
        view.addSubview(statusBar)
        statusBar.backgroundColor = UIColor(hexString: "#dddddd")
        statusBar.frame = .init(x: 0, y: 44, width: view.bounds.width, height: 44)
        statusBar.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        statusBar.setContentHuggingPriority(.required, for: .vertical)
        
        
        view.addSubview(listView)
        listView.frame = .init(x: 0, y: self.statusBar.bounds.height + 44, width: self.view.bounds.width, height: self.view.bounds.height)
        
        configButtons()
        
        let imageList = fetchImages()
        
        menuProduct = HorizontalStackView(arrangedSubviews: imageList , spacing: 0, alignment: .fill, distribution: .equalCentering)
        titleBar.frame = .init( x: statusBar.bounds.width/2 - 50, y: 0, width: 100, height: 44)
        titleBar.textAlignment = .center
        
        statusBar.addSubview(titleBar)
        statusBar.addSubview(menuProduct)
        
        titleBar.text = "Snacks"
        titleBar.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        menuProduct.frame = .init(x: 0, y: 44, width: 0, height: 0)
        menuProduct.bottomAnchor.constraint(equalTo: statusBar.bottomAnchor, constant: -54).isActive = true
        menuProduct.isHidden = true
        
        tableProduct.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableProduct.estimatedRowHeight = 44.0
        tableProduct.delegate = self
        tableProduct.dataSource = self
        
        listView.addSubview(tableProduct)
        tableProduct.matchParent()
//        tableProduct.anchors(topAnchor: statusBar.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: view.bottomAnchor)
    }
    
    fileprivate func configButtons() {
        statusBar.addSubview(plusButton)
        plusButton.constraintWidth(equalToConstant: 44, heightEqualToConstant: 44)
        plusButton.trailingAnchor.constraint(equalTo: statusBar.trailingAnchor, constant: 0).isActive = true
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 44)
        plusButton.setTitle("＋", for: .normal)
        plusButton.titleLabel?.adjustsFontForContentSizeCategory = true
        plusButton.addTarget(self, action: #selector(plusAnimation), for: .touchUpInside)
        
        statusBar.addSubview(exitButton)
        exitButton.constraintWidth(equalToConstant: 44, heightEqualToConstant: 44)
        exitButton.trailingAnchor.constraint(equalTo: statusBar.trailingAnchor, constant: 0).isActive = true
        exitButton.titleLabel?.font = UIFont.systemFont(ofSize: 44)
        exitButton.setTitle("＋", for: .normal)
        exitButton.transform = rotateTransform45
        exitButton.titleLabel?.adjustsFontForContentSizeCategory = true
        exitButton.addTarget(self, action: #selector(exitAnimation), for: .touchUpInside)
        exitButton.isHidden = true
    }
    @objc func add(_ sender:UIButton) {
        
        switch sender.currentImage!  {
        
        case UIImage(named:"oreos"):
            listProduct.append("Oreos")
        case UIImage(named:"pizza_pockets"):
            listProduct.append("Pizza Pockets")
        case UIImage(named:"pop_tarts"):
            listProduct.append("Pop Tarts")
        case UIImage(named:"popsicle"):
            listProduct.append("Popsicle")
        case UIImage(named:"ramen"):
            listProduct.append("Ramen")
        default:
            print("Invalid Option")
        }
        
        tableProduct.reloadData()
        
    }
    
    fileprivate func fetchImages() -> [UIButton] {
        let widthEachImage = statusBar.bounds.width / 5
        let heightEachImage = (statusBar.bounds.width / 5) * 1.5
        
        
        
        let image1 : UIButton = {
            let img = UIButton()
            img.setImage(UIImage(named:"oreos") , for: .normal)
            img.constraintWidth(equalToConstant: widthEachImage, heightEqualToConstant: heightEachImage)
            img.addTarget(self, action: #selector(add(_:)), for: .touchUpInside)
            return img
        } ()
        
        let image2 : UIButton = {
            let img = UIButton()
            img.setImage(UIImage(named:"pizza_pockets") , for: .normal)
            img.constraintWidth(equalToConstant: widthEachImage, heightEqualToConstant: heightEachImage)
            img.addTarget(self, action: #selector(add(_:)), for: .touchUpInside)
            return img
        } ()
        
        let image3 : UIButton = {
            let img = UIButton()
            img.setImage(UIImage(named:"pop_tarts") , for: .normal)
            img.constraintWidth(equalToConstant: widthEachImage, heightEqualToConstant: heightEachImage)
            img.addTarget(self, action: #selector(add(_:)), for: .touchUpInside)
            return img
        } ()
        
        let image4 : UIButton = {
            let img = UIButton()
            img.setImage(UIImage(named:"popsicle") , for: .normal)
            img.constraintWidth(equalToConstant: widthEachImage, heightEqualToConstant: heightEachImage)
            img.addTarget(self, action: #selector(add(_:)), for: .touchUpInside)
            return img
        } ()
        
        let image5 : UIButton = {
            let img = UIButton()
            img.setImage(UIImage(named:"ramen") , for: .normal)
            img.constraintWidth(equalToConstant: widthEachImage, heightEqualToConstant: heightEachImage)
            img.addTarget(self, action: #selector(add(_:)), for: .touchUpInside)
            return img
        } ()
        
        return [image1,image2,image3,image4,image5]
        
    }
    
    @objc func plusAnimation() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1) {
            self.statusBar.frame = CGRect(x: 0, y: 44, width: self.view.bounds.width, height: 200)
            self.listView.frame = CGRect(x: 0, y: self.statusBar.bounds.height + 44, width: self.view.bounds.width, height: self.view.bounds.height - (self.statusBar.bounds.height + 44))
            self.titleBar.frame = CGRect(x: self.statusBar.bounds.width/2 - 75, y: 40, width: 150, height: 44)
            self.tableProduct.setNeedsUpdateConstraints()
            self.titleBar.text = "Add a Snack"
            self.plusButton.transform = self.rotateTransform180.concatenating(self.rotateTransform45)
            self.menuProduct.isHidden.toggle()
            let translateTransform = CGAffineTransform(translationX: 0, y: 44)
            self.menuProduct.transform = translateTransform
        } completion: { (_) in
            self.plusButton.isHidden.toggle()
            self.exitButton.isHidden.toggle()
        }
    }
    
    @objc func exitAnimation() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.statusBar.frame = CGRect(x: 0, y: 44, width: self.view.bounds.width, height: 44)
            self.listView.frame = CGRect(x: 0, y: self.statusBar.bounds.height + 44, width: self.view.bounds.width, height: self.view.bounds.height - (self.statusBar.bounds.height + 44))
            self.titleBar.frame = CGRect(x: self.statusBar.bounds.width/2 - 50, y: 0, width: 100, height: 44)
            self.tableProduct.setNeedsUpdateConstraints()
            self.titleBar.text = "Snacks"
            self.plusButton.isHidden.toggle()
            self.exitButton.isHidden.toggle()
            self.plusButton.transform = .identity
            self.menuProduct.isHidden.toggle()
            self.menuProduct.transform = .identity
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = listProduct[listProduct.count - indexPath.row - 1]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
}
