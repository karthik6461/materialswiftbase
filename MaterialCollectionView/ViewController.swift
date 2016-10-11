import UIKit
import Material

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	/// A list of all the data source items.
	private var dataSourceItems: Array<MaterialDataSourceItem>!
	
	/// A collectionView used to display entries.
	private var collectionView: UICollectionView!
	
	override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 250, height: 400)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)
	}
	

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
       // cell.contentView.layout(prepareBasicImageCardViewExample()).top(100).left(20).right(20)
        cell.contentView.layout(prepareImageCardViewWithoutDetailLabelAndDividerExample() ).top(10).left(20).right(20)
        return cell
    }
    
    private func prepareBasicImageCardViewExample() -> ImageCardView{
        let imageCardView: ImageCardView = ImageCardView()
        imageCardView.maxImageHeight = 150
        
        // Image.
        //let size: CGSize = CGSizeMake(MaterialDevice.width - CGFloat(40), 150)
        let size: CGSize = CGSizeMake(MaterialDevice.width - CGFloat(10), 150)

        imageCardView.image = UIImage.imageWithColor(MaterialColor.cyan.darken1, size: size)
        
        // Title label.
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Welcome Back!"
        titleLabel.textColor = MaterialColor.white
        titleLabel.font = RobotoFont.mediumWithSize(24)
        imageCardView.titleLabel = titleLabel
        imageCardView.titleLabelInset.top = 100
        
        // Detail label.
        let detailLabel: UILabel = UILabel()
        detailLabel.text = " It’s been a while what happened in that part of the world"
        detailLabel.numberOfLines = 0
        imageCardView.contentView = detailLabel
        
        // Yes button.
        let btn1: FlatButton = FlatButton()
        btn1.pulseColor = MaterialColor.cyan.lighten1
        btn1.setTitle("YES", forState: .Normal)
        btn1.setTitleColor(MaterialColor.cyan.darken1, forState: .Normal)
        
        // No button.
        let btn2: FlatButton = FlatButton()
        btn2.pulseColor = MaterialColor.cyan.lighten1
        btn2.setTitle("NO", forState: .Normal)
        btn2.setTitleColor(MaterialColor.cyan.darken1, forState: .Normal)
        
        // Add buttons to left side.
        imageCardView.leftButtons = [btn1, btn2]
        
        // To support orientation changes, use Layout.
        //view.layout(imageCardView).top(100).left(20).right(20)
        return imageCardView
    }
    
    private func prepareImageCardViewWithoutDetailLabelAndDividerExample() -> ImageCardView{
        let imageCardView: ImageCardView = ImageCardView()
        imageCardView.pulseColor = MaterialColor.purple.base
        imageCardView.divider = true
        imageCardView.maxImageHeight = 150
        
        /*let url = NSURL(string:"http://lisaroot.s3-website-us-west-1.amazonaws.com/images/rohanlisa.jpg")
        let data = NSData(contentsOfURL:url!)
        if data != nil {
            imageCardView.image = UIImage(data:data!)
        }*/
        // Image.
        imageCardView.image = UIImage(named: "rohanlisa")
        
        // Title label.
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Material Design"
        titleLabel.textColor = MaterialColor.white
        titleLabel.font = RobotoFont.regularWithSize(24)
        imageCardView.titleLabel = titleLabel
        imageCardView.titleLabelInset.top = 80
        
        // Star button.
        let img1: UIImage? = MaterialIcon.cm.star
        let btn1: IconButton = IconButton()
        btn1.pulseColor = MaterialColor.blueGrey.lighten1
        btn1.tintColor = MaterialColor.blueGrey.darken3
        btn1.setImage(img1, forState: .Normal)
        btn1.setImage(img1, forState: .Highlighted)
        
        // Library button.
        let img2: UIImage? = MaterialIcon.cm.audioLibrary
        let btn2: IconButton = IconButton()
        btn2.pulseColor = MaterialColor.blueGrey.lighten1
        btn2.tintColor = MaterialColor.blueGrey.darken3
        btn2.setImage(img2, forState: .Normal)
        btn2.setImage(img2, forState: .Highlighted)
        
        // Share button.
        let img3: UIImage? = MaterialIcon.share
        let btn3: IconButton = IconButton()
        btn3.pulseColor = MaterialColor.blueGrey.lighten1
        btn3.tintColor = MaterialColor.blueGrey.darken3
        btn3.setImage(img3, forState: .Normal)
        btn3.setImage(img3, forState: .Highlighted)
        
        // Add buttons to right side.
        imageCardView.rightButtons = [btn1, btn2, btn3]
        
        return imageCardView
        
        // To support orientation changes, use Layout.
       // view.layout(imageCardView).top(100).left(20).right(20)
    }
}




