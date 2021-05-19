//
//  ViewController.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 18/05/21.
//
import Gemini
import UIKit

class ViewController: UIViewController {
    
    var arraySeries  = [SingleAnimeObject]()
    var arraySesionL = [SingleLastObject]()
    
    @IBOutlet weak var tableviewTop: UITableView!
    @IBOutlet weak var collectionViewTop: GeminiCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nib = UINib.init(nibName: "TopCollectionViewCell", bundle: nil)
        collectionViewTop.register(nib, forCellWithReuseIdentifier: "cell")
        let nibT = UINib.init(nibName: "TopTableViewCell", bundle: nil)
        tableviewTop.register(nibT, forCellReuseIdentifier: "cell")
        
        tableviewTop.delegate = self
        tableviewTop.dataSource = self
        collectionViewTop.delegate = self
        collectionViewTop.dataSource = self
        configureAnimation()
  
        
        GetSeriesClass(controller: self, query: "", Ok: {rest in
            
            for arrayresult in rest.results{
            self.arraySeries.append(arrayresult)
            }
            
            self.collectionViewTop.reloadData()
            
        })
        GetLastClass(controller: self, query: "", Ok: {rest in
            
            for arrayresult in rest.monday{
            self.arraySesionL.append(arrayresult)
            }
            
            self.tableviewTop.reloadData()
            
        })
    }
    
    // Configure animation and properties
    func configureAnimation() {
        collectionViewTop.gemini
            .customAnimation()
            .translation(y: 50)
            .rotationAngle(y: 13)
            .ease(.easeOutExpo)
            .shadowEffect(.fadeIn)
            .maxShadowAlpha(0.3)
           
    }
    func configureAnimationP() {
        collectionViewTop.gemini
            .pitchRotationAnimation()
            .pitchEffect(.pitchDown)
           
    }

}

extension ViewController:UITableViewDelegate,UICollectionViewDelegate,UITableViewDataSource, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraySeries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TopCollectionViewCell
        
        let url = URL(string: arraySeries[indexPath.row].image_url)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        cell.topImage.image = UIImage(data: data!)

        
        self.collectionViewTop.animateCell(cell)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : Detail = storyboard.instantiateViewController(withIdentifier: "Detail") as! Detail
        
        vc.dataDetailTop = arraySeries[indexPath.row]
        
        let navigationController = UINavigationController(rootViewController: vc)
       // navigationController.pushViewController(navigationController, animated: true)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Call animation function
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionViewTop.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        // Animate
        if let cell = cell as? TopCollectionViewCell {
            self.collectionViewTop.animateCell(cell)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySesionL.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TopTableViewCell
        
        let url = URL(string: arraySesionL[indexPath.row].image_url)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        cell.imageSerie.image = UIImage(data: data!)

        cell.lbEpi.text = "Episode \(arraySesionL[indexPath.row].episodes)"
        cell.lbTime.text = "\(arraySesionL[indexPath.row].score)"
        cell.lbTitle.text = "\(arraySesionL[indexPath.row].title)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : Detail = storyboard.instantiateViewController(withIdentifier: "Detail") as! Detail
        
        vc.dataDetailSesion = arraySesionL[indexPath.row]
        
        let navigationController = UINavigationController(rootViewController: vc)
       // navigationController.pushViewController(navigationController, animated: true)
        self.present(navigationController, animated: true, completion: nil)
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if collectionView == collectionViewTop {
                return CGSize(width: 150, height: 250) // Collection View size right?
            }
            else {
                return CGSize(width: 150, height: 250)
            }

}

}



